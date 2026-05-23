import 'package:flutter_test/flutter_test.dart';
import 'package:home_medicine_box/src/domain/image_cleanup.dart';
import 'package:home_medicine_box/src/domain/models.dart';

void main() {
  test('deleting a medicine removes orphaned image references only', () {
    const service = ImageCleanupService();
    final now = DateTime(2026, 5, 23);
    final state = HomeMedicineState(
      members: const [
        FamilyMember(
            id: 'member', name: '家庭共用', relation: MemberRelation.shared),
      ],
      medicines: [
        MedicineItem(
          id: 'medicine-1',
          memberId: 'member',
          name: '药品',
          specification: '10ml',
          dosageForm: '口服液',
          imageAssetIds: const ['image-delete'],
          createdAt: now,
          updatedAt: now,
        ),
      ],
      batches: [
        MedicineBatch(
          id: 'batch-1',
          medicineItemId: 'medicine-1',
          quantity: 1,
          unit: '盒',
          expiryDate: now,
        ),
      ],
      visits: const [],
      documents: [
        MedicalDocumentRecord(
          id: 'doc-1',
          visitRecordId: 'visit-1',
          documentType: DocumentType.diagnosis,
          summary: '文档',
          imageAssetIds: ['image-keep'],
          createdAt: now,
        ),
      ],
      drafts: const [],
      images: [
        LocalImageAsset(
          id: 'image-delete',
          localPath: 'medicine.jpg',
          createdAt: now,
        ),
        LocalImageAsset(
          id: 'image-keep',
          localPath: 'document.jpg',
          createdAt: now,
        ),
      ],
      selectedMemberId: 'member',
    );

    final result = service.removeMedicineAndCollectOrphans(state, 'medicine-1');

    expect(result.orphanedImageIds, ['image-delete']);
    expect(result.nextState.images.map((image) => image.id), ['image-keep']);
    expect(result.nextState.medicines, isEmpty);
    expect(result.nextState.batches, isEmpty);
  });
}
