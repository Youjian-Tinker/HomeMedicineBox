import '../models/local_image_asset.dart';
import '../models/model_enums.dart';
import '../models/recognition_draft.dart';

abstract class RecognitionProvider {
  Future<RecognitionDraft> recognizeMedicine({
    required String memberId,
    required List<LocalImageAsset> images,
  });

  Future<RecognitionDraft> recognizeMedicalDocument({
    required String memberId,
    required List<LocalImageAsset> images,
    MedicalDocumentType? hint,
  });
}

