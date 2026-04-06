import '../../domain/models/model_enums.dart';
import '../../domain/models/recognition_draft.dart';
import '../../domain/repositories/draft_repository.dart';
import 'seed_data.dart';

class InMemoryDraftRepository implements DraftRepository {
  InMemoryDraftRepository._(List<RecognitionDraft> drafts)
      : _drafts = {for (final draft in drafts) draft.id: draft};

  factory InMemoryDraftRepository.seeded() {
    return InMemoryDraftRepository._(SeedData.drafts);
  }

  final Map<String, RecognitionDraft> _drafts;

  @override
  Future<void> discardDraft(String id) async {
    final draft = _drafts[id];
    if (draft == null) {
      return;
    }

    _drafts[id] = draft.copyWith(
      status: DraftStatus.discarded,
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<RecognitionDraft?> getDraft(String id) async => _drafts[id];

  @override
  Future<List<RecognitionDraft>> listDrafts({
    String? memberId,
    DraftType? type,
  }) async {
    var drafts = _drafts.values.toList();

    if (memberId != null) {
      drafts = drafts.where((draft) => draft.memberId == memberId).toList();
    }

    if (type != null) {
      drafts = drafts.where((draft) => draft.draftType == type).toList();
    }

    drafts.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return drafts;
  }

  @override
  Future<void> markPromoted(String id) async {
    final draft = _drafts[id];
    if (draft == null) {
      return;
    }

    _drafts[id] = draft.copyWith(
      status: DraftStatus.promoted,
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<void> saveDraft(RecognitionDraft draft) async {
    _drafts[draft.id] = draft;
  }
}

