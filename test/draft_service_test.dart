import 'package:flutter_test/flutter_test.dart';
import 'package:home_medicine_box/src/domain/draft_service.dart';
import 'package:home_medicine_box/src/domain/models.dart';

void main() {
  test('medicine draft is promoted only after confirmation', () {
    const service = DraftService();
    final now = DateTime(2026, 5, 23);
    final draft = RecognitionDraft(
      id: 'draft-1',
      draftType: DraftType.medicine,
      memberId: 'member-1',
      status: DraftStatus.pending,
      payload: {
        'name': '对乙酰氨基酚',
        'specification': '0.5g',
        'dosageForm': '片剂',
        'quantity': 2,
        'unit': '盒',
        'expiryDate': '2027-01-01',
      },
      missingFields: const [],
      imageAssetIds: const ['image-1'],
      createdAt: now,
      updatedAt: now,
    );

    final result = service.promoteMedicineDraft(
      draft: draft,
      medicineId: 'medicine-1',
      batchId: 'batch-1',
      now: now,
    );

    expect(result.medicine.name, '对乙酰氨基酚');
    expect(result.batch.quantity, 2);
    expect(result.promotedDraft.status, DraftStatus.promoted);
  });

  test(
      'missing required medicine draft fields fail before formal record writes',
      () {
    const service = DraftService();
    final now = DateTime(2026, 5, 23);
    final draft = RecognitionDraft(
      id: 'draft-1',
      draftType: DraftType.medicine,
      memberId: 'member-1',
      status: DraftStatus.pending,
      payload: const {'name': '缺规格药品'},
      missingFields: const ['specification'],
      imageAssetIds: const [],
      createdAt: now,
      updatedAt: now,
    );

    expect(
      () => service.promoteMedicineDraft(
        draft: draft,
        medicineId: 'medicine-1',
        batchId: 'batch-1',
        now: now,
      ),
      throwsArgumentError,
    );
  });
}
