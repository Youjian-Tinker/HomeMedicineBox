import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local/app_database.dart';
import '../data/local/home_repository.dart';
import '../domain/draft_service.dart';
import '../domain/image_cleanup.dart';
import '../domain/models.dart';
import '../domain/reminder_engine.dart';

final reminderEngineProvider = Provider((_) => const ReminderEngine());
final draftServiceProvider = Provider((_) => const DraftService());
final imageCleanupServiceProvider =
    Provider((_) => const ImageCleanupService());

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository(ref.watch(appDatabaseProvider));
});

final homeStateProvider =
    StateNotifierProvider<HomeStateController, HomeMedicineState>((ref) {
  return HomeStateController(repository: ref.watch(homeRepositoryProvider));
});

class HomeStateController extends StateNotifier<HomeMedicineState> {
  HomeStateController({required HomeRepository repository})
      : _repository = repository,
        super(_emptyState()) {
    reload();
  }

  final HomeRepository _repository;

  Future<void> reload() async {
    state =
        await _repository.loadState(selectedMemberId: state.selectedMemberId);
  }

  void selectMember(String memberId) {
    state = state.copyWith(selectedMemberId: memberId);
  }

  Future<void> addMedicine(MedicineEntry entry) async {
    await _repository.addMedicine(entry);
    await reload();
  }

  Future<void> updateMedicine(String id, MedicineUpdate update) async {
    await _repository.updateMedicine(id, update);
    await reload();
  }

  Future<void> reduceBatchQuantity(String batchId, double amount) async {
    await _repository.reduceBatchQuantity(batchId, amount);
    await reload();
  }

  Future<void> deleteMedicine(String medicineId) async {
    await _repository.deleteMedicine(medicineId);
    await reload();
  }

  Future<void> addVisit(VisitEntry entry) async {
    await _repository.addVisit(entry);
    await reload();
  }

  Future<void> deleteVisit(String visitId) async {
    await _repository.deleteVisit(visitId);
    await reload();
  }

  Future<void> addManualMedicineDraft() async {
    await _repository.addManualMedicineDraft(state.selectedMemberId);
    await reload();
  }

  Future<void> promoteDraft(String draftId) async {
    final draft = state.drafts.firstWhere((item) => item.id == draftId);
    await _repository.promoteMedicineDraft(draft);
    await reload();
  }

  Future<void> deleteDraft(String draftId) async {
    await _repository.deleteDraft(draftId);
    await reload();
  }
}

HomeMedicineState _emptyState() {
  return const HomeMedicineState(
    members: [],
    medicines: [],
    batches: [],
    visits: [],
    documents: [],
    drafts: [],
    images: [],
    selectedMemberId: '',
  );
}
