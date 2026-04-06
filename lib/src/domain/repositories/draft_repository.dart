import '../models/model_enums.dart';
import '../models/recognition_draft.dart';

abstract class DraftRepository {
  Future<List<RecognitionDraft>> listDrafts({
    String? memberId,
    DraftType? type,
  });

  Future<RecognitionDraft?> getDraft(String id);

  Future<void> saveDraft(RecognitionDraft draft);

  Future<void> markPromoted(String id);

  Future<void> discardDraft(String id);
}

