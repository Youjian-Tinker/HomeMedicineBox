import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/mock/default_reminder_engine.dart';
import '../data/mock/fake_security_gate.dart';
import '../data/mock/in_memory_draft_repository.dart';
import '../data/mock/in_memory_image_store.dart';
import '../data/mock/in_memory_local_repository.dart';
import '../data/mock/mock_recognition_provider.dart';
import '../data/mock/seed_data.dart';
import '../domain/models/family_member.dart';
import '../domain/models/medicine_item.dart';
import '../domain/models/recognition_draft.dart';
import '../domain/models/reminder_item.dart';
import '../domain/models/visit_record.dart';
import '../domain/repositories/draft_repository.dart';
import '../domain/repositories/local_repository.dart';
import '../domain/services/image_store.dart';
import '../domain/services/recognition_provider.dart';
import '../domain/services/reminder_engine.dart';
import '../domain/services/security_gate.dart';

final localRepositoryProvider = Provider<LocalRepository>(
  (ref) => InMemoryLocalRepository.seeded(),
);

final draftRepositoryProvider = Provider<DraftRepository>(
  (ref) => InMemoryDraftRepository.seeded(),
);

final imageStoreProvider = Provider<ImageStore>(
  (ref) => InMemoryImageStore.seeded(),
);

final recognitionProviderProvider = Provider<RecognitionProvider>(
  (ref) => MockRecognitionProvider(),
);

final reminderEngineProvider = Provider<ReminderEngine>(
  (ref) => const DefaultReminderEngine(),
);

final securityGateProvider = Provider<SecurityGate>(
  (ref) => const FakeSecurityGate(),
);

final repositoryInvalidationProvider = StateProvider<int>((ref) => 0);

final selectedMemberIdProvider = StateProvider<String?>(
  (ref) => SeedData.sharedMemberId,
);

final familyMembersProvider = FutureProvider<List<FamilyMember>>((ref) async {
  ref.watch(repositoryInvalidationProvider);
  final repository = ref.watch(localRepositoryProvider);
  return repository.listFamilyMembers();
});

final medicineItemsProvider = FutureProvider<List<MedicineItem>>((ref) async {
  ref.watch(repositoryInvalidationProvider);
  final repository = ref.watch(localRepositoryProvider);
  final memberId = ref.watch(selectedMemberIdProvider);
  return repository.listMedicineItems(memberId: memberId);
});

final visitRecordsProvider = FutureProvider<List<VisitRecord>>((ref) async {
  ref.watch(repositoryInvalidationProvider);
  final repository = ref.watch(localRepositoryProvider);
  final memberId = ref.watch(selectedMemberIdProvider);
  return repository.listVisitRecords(memberId: memberId);
});

final draftsProvider = FutureProvider<List<RecognitionDraft>>((ref) async {
  ref.watch(repositoryInvalidationProvider);
  final repository = ref.watch(draftRepositoryProvider);
  final memberId = ref.watch(selectedMemberIdProvider);
  return repository.listDrafts(memberId: memberId);
});

final remindersProvider = FutureProvider<List<ReminderItem>>((ref) async {
  final medicines = await ref.watch(medicineItemsProvider.future);
  final members = await ref.watch(familyMembersProvider.future);
  final engine = ref.watch(reminderEngineProvider);
  return engine.buildReminders(medicines: medicines, familyMembers: members);
});

