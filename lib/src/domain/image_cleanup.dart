import 'models.dart';

class ImageCleanupResult {
  const ImageCleanupResult({
    required this.nextState,
    required this.orphanedImageIds,
  });

  final HomeMedicineState nextState;
  final List<String> orphanedImageIds;
}

class ImageCleanupService {
  const ImageCleanupService();

  ImageCleanupResult removeMedicineAndCollectOrphans(
    HomeMedicineState state,
    String medicineId,
  ) {
    final nextMedicines =
        state.medicines.where((medicine) => medicine.id != medicineId).toList();
    final nextBatches = state.batches
        .where((batch) => batch.medicineItemId != medicineId)
        .toList();
    final nextState =
        state.copyWith(medicines: nextMedicines, batches: nextBatches);
    final referenced = _referencedImageIds(nextState);
    final orphans = state.images
        .where((image) => !referenced.contains(image.id))
        .map((image) => image.id)
        .toList();

    return ImageCleanupResult(
      nextState: nextState.copyWith(
        images:
            state.images.where((image) => !orphans.contains(image.id)).toList(),
      ),
      orphanedImageIds: orphans,
    );
  }

  Set<String> _referencedImageIds(HomeMedicineState state) {
    return {
      for (final medicine in state.medicines) ...medicine.imageAssetIds,
      for (final document in state.documents) ...document.imageAssetIds,
      for (final draft in state.drafts) ...draft.imageAssetIds,
    };
  }
}
