import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../domain/draft_service.dart';
import '../domain/image_cleanup.dart';
import '../domain/models.dart';
import '../domain/reminder_engine.dart';

final reminderEngineProvider = Provider((_) => const ReminderEngine());
final draftServiceProvider = Provider((_) => const DraftService());
final imageCleanupServiceProvider =
    Provider((_) => const ImageCleanupService());
final homeStateProvider =
    StateNotifierProvider<HomeStateController, HomeMedicineState>((ref) {
  return HomeStateController(
    draftService: ref.watch(draftServiceProvider),
    cleanupService: ref.watch(imageCleanupServiceProvider),
  );
});

class HomeStateController extends StateNotifier<HomeMedicineState> {
  HomeStateController({
    required DraftService draftService,
    required ImageCleanupService cleanupService,
  })  : _draftService = draftService,
        _cleanupService = cleanupService,
        super(_seedState());

  final DraftService _draftService;
  final ImageCleanupService _cleanupService;
  final _uuid = const Uuid();

  void selectMember(String memberId) {
    state = state.copyWith(selectedMemberId: memberId);
  }

  void addManualMedicineDraft() {
    final now = DateTime.now();
    final draft = RecognitionDraft(
      id: _uuid.v4(),
      draftType: DraftType.medicine,
      memberId: state.selectedMemberId,
      status: DraftStatus.needsInput,
      payload: {
        'name': '待补充药品',
        'specification': '请填写规格',
        'dosageForm': '片剂',
        'quantity': 1,
        'unit': '盒',
        'expiryDate': now.add(const Duration(days: 180)).toIso8601String(),
      },
      missingFields: const ['药品名称', '规格', '有效期'],
      imageAssetIds: const [],
      createdAt: now,
      updatedAt: now,
    );
    state = state.copyWith(drafts: [...state.drafts, draft]);
  }

  void promoteDraft(String draftId) {
    final draft = state.drafts.firstWhere((item) => item.id == draftId);
    final result = _draftService.promoteMedicineDraft(
      draft: draft,
      medicineId: _uuid.v4(),
      batchId: _uuid.v4(),
      now: DateTime.now(),
    );
    state = state.copyWith(
      medicines: [...state.medicines, result.medicine],
      batches: [...state.batches, result.batch],
      drafts: state.drafts
          .map((item) => item.id == draftId ? result.promotedDraft : item)
          .toList(),
    );
  }

  void deleteMedicine(String medicineId) {
    state = _cleanupService
        .removeMedicineAndCollectOrphans(state, medicineId)
        .nextState;
  }
}

HomeMedicineState _seedState() {
  final now = DateTime.now();
  const shared = FamilyMember(
    id: 'member-shared',
    name: '家庭共用',
    relation: MemberRelation.shared,
    isSystemDefault: true,
  );
  const child = FamilyMember(
    id: 'member-child',
    name: '孩子',
    relation: MemberRelation.child,
  );
  final image = LocalImageAsset(
    id: 'image-1',
    localPath: 'Documents/images/medicine/sample.jpg',
    createdAt: now,
  );
  final medicine = MedicineItem(
    id: 'medicine-1',
    memberId: shared.id,
    name: '布洛芬混悬液',
    genericName: 'Ibuprofen',
    specification: '100ml',
    dosageForm: '口服混悬液',
    indication: '发热、疼痛',
    storageNotes: '避光保存',
    imageAssetIds: [image.id],
    createdAt: now.subtract(const Duration(days: 7)),
    updatedAt: now.subtract(const Duration(days: 1)),
  );
  final batch = MedicineBatch(
    id: 'batch-1',
    medicineItemId: medicine.id,
    quantity: 1,
    unit: '瓶',
    expiryDate: now.add(const Duration(days: 20)),
    lowStockThreshold: 1,
  );
  final visit = VisitRecord(
    id: 'visit-1',
    memberId: child.id,
    visitDate: now.subtract(const Duration(days: 12)),
    hospitalName: '社区医院',
    department: '儿科',
    diagnosisSummary: '上呼吸道感染复查资料',
    documentIds: const ['doc-1'],
    createdAt: now.subtract(const Duration(days: 12)),
  );
  final document = MedicalDocumentRecord(
    id: 'doc-1',
    visitRecordId: visit.id,
    documentType: DocumentType.diagnosis,
    summary: '诊断书与处方摘要',
    imageAssetIds: const [],
    createdAt: now.subtract(const Duration(days: 12)),
  );

  return HomeMedicineState(
    members: const [shared, child],
    medicines: [medicine],
    batches: [batch],
    visits: [visit],
    documents: [document],
    drafts: const [],
    images: [image],
    selectedMemberId: shared.id,
  );
}
