import 'models.dart';

class DraftPromotionResult {
  const DraftPromotionResult({
    required this.medicine,
    required this.batch,
    required this.promotedDraft,
  });

  final MedicineItem medicine;
  final MedicineBatch batch;
  final RecognitionDraft promotedDraft;
}

class DraftService {
  const DraftService();

  RecognitionDraft failedDraft({
    required String id,
    required DraftType draftType,
    required String memberId,
    required List<String> imageAssetIds,
    required String message,
    required DateTime now,
  }) {
    return RecognitionDraft(
      id: id,
      draftType: draftType,
      memberId: memberId,
      status: DraftStatus.failed,
      payload: const {},
      missingFields: const [],
      imageAssetIds: imageAssetIds,
      errorMessage: message,
      createdAt: now,
      updatedAt: now,
    );
  }

  DraftPromotionResult promoteMedicineDraft({
    required RecognitionDraft draft,
    required String medicineId,
    required String batchId,
    required DateTime now,
  }) {
    if (draft.status == DraftStatus.promoted) {
      throw StateError('Draft has already been promoted.');
    }
    if (draft.draftType != DraftType.medicine) {
      throw ArgumentError('Only medicine drafts can become medicines.');
    }

    final name = _requiredString(draft.payload, 'name');
    final specification = _requiredString(draft.payload, 'specification');
    final dosageForm = _requiredString(draft.payload, 'dosageForm');
    final quantity = _number(draft.payload, 'quantity', fallback: 1);
    final unit = _string(draft.payload, 'unit', fallback: '盒');
    final expiryDate = _date(draft.payload, 'expiryDate', fallback: now);

    final medicine = MedicineItem(
      id: medicineId,
      memberId: draft.memberId,
      name: name,
      genericName: _nullableString(draft.payload, 'genericName'),
      specification: specification,
      dosageForm: dosageForm,
      indication: _nullableString(draft.payload, 'indication'),
      storageNotes: _nullableString(draft.payload, 'storageNotes'),
      imageAssetIds: draft.imageAssetIds,
      createdAt: now,
      updatedAt: now,
    );
    final batch = MedicineBatch(
      id: batchId,
      medicineItemId: medicine.id,
      quantity: quantity,
      unit: unit,
      expiryDate: expiryDate,
      lowStockThreshold: _number(
        draft.payload,
        'lowStockThreshold',
        fallback: 1,
      ),
    );

    return DraftPromotionResult(
      medicine: medicine,
      batch: batch,
      promotedDraft:
          draft.copyWith(status: DraftStatus.promoted, updatedAt: now),
    );
  }

  String _requiredString(Map<String, Object?> payload, String key) {
    final value = payload[key];
    if (value is String && value.trim().isNotEmpty) {
      return value.trim();
    }
    throw ArgumentError('Missing required field: $key');
  }

  String _string(
    Map<String, Object?> payload,
    String key, {
    required String fallback,
  }) {
    final value = payload[key];
    return value is String && value.trim().isNotEmpty ? value.trim() : fallback;
  }

  String? _nullableString(Map<String, Object?> payload, String key) {
    final value = payload[key];
    return value is String && value.trim().isNotEmpty ? value.trim() : null;
  }

  double _number(
    Map<String, Object?> payload,
    String key, {
    required double fallback,
  }) {
    final value = payload[key];
    if (value is num) {
      return value.toDouble();
    }
    return fallback;
  }

  DateTime _date(
    Map<String, Object?> payload,
    String key, {
    required DateTime fallback,
  }) {
    final value = payload[key];
    if (value is DateTime) {
      return value;
    }
    if (value is String) {
      return DateTime.tryParse(value) ?? fallback;
    }
    return fallback;
  }
}
