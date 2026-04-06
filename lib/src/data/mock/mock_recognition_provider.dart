import '../../core/utils/id.dart';
import '../../domain/models/local_image_asset.dart';
import '../../domain/models/model_enums.dart';
import '../../domain/models/recognition_draft.dart';
import '../../domain/services/recognition_provider.dart';

class MockRecognitionProvider implements RecognitionProvider {
  const MockRecognitionProvider();

  @override
  Future<RecognitionDraft> recognizeMedicalDocument({
    required String memberId,
    required List<LocalImageAsset> images,
    MedicalDocumentType? hint,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final now = DateTime.now();

    return RecognitionDraft(
      id: generateId('draft-medical'),
      draftType: DraftType.medicalDocument,
      memberId: memberId,
      status: DraftStatus.pendingReview,
      recognizedPayload: {
        'documentType': (hint ?? MedicalDocumentType.prescription).name,
        'visitDate': '${now.year}-${now.month}-${now.day}',
        'hospitalName': '示例医院',
        'summary': '识别到处方信息，待用户确认',
      },
      missingFields: const [],
      confidenceHints: const {'hospitalName': 0.79},
      imageAssetIds: images.map((asset) => asset.id).toList(),
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  Future<RecognitionDraft> recognizeMedicine({
    required String memberId,
    required List<LocalImageAsset> images,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    final now = DateTime.now();

    return RecognitionDraft(
      id: generateId('draft-medicine'),
      draftType: DraftType.medicine,
      memberId: memberId,
      status: DraftStatus.pendingReview,
      recognizedPayload: {
        'name': '示例药品',
        'specification': '0.25g*12片',
        'dosageForm': '片剂',
        'quantity': 1,
        'unit': '盒',
        'expiryDate': '${now.year + 1}-12-31',
      },
      missingFields: const [],
      confidenceHints: const {
        'name': 0.81,
        'expiryDate': 0.74,
      },
      imageAssetIds: images.map((asset) => asset.id).toList(),
      createdAt: now,
      updatedAt: now,
    );
  }
}

