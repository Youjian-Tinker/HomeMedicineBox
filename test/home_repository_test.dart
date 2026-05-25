import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_medicine_box/src/data/local/app_database.dart';
import 'package:home_medicine_box/src/data/local/home_repository.dart';
import 'package:home_medicine_box/src/domain/models.dart';
import 'package:home_medicine_box/src/domain/reminder_engine.dart';

void main() {
  late AppDatabase database;
  late HomeRepository repository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    repository = HomeRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('first launch creates default shared member', () async {
    final state = await repository.loadState();

    expect(state.members, hasLength(1));
    expect(state.members.single.name, '家庭共用');
    expect(state.members.single.relation, MemberRelation.shared);
    expect(state.members.single.isSystemDefault, isTrue);
    expect(state.selectedMemberId, state.members.single.id);
  });

  test('added medicine can be read from repository', () async {
    final state = await repository.loadState();

    await repository.addMedicine(
      MedicineEntry(
        memberId: state.selectedMemberId,
        name: '布洛芬',
        specification: '100ml',
        dosageForm: '混悬液',
        quantity: 2,
        unit: '瓶',
        expiryDate: DateTime(2026, 6, 10),
        lowStockThreshold: 1,
      ),
    );

    final next = await repository.loadState();
    expect(next.medicines.single.name, '布洛芬');
    expect(next.batches.single.quantity, 2);
  });

  test('medicine batch reminder is calculated from persisted batch', () async {
    final state = await repository.loadState();

    await repository.addMedicine(
      MedicineEntry(
        memberId: state.selectedMemberId,
        name: '临期药',
        specification: '10片',
        dosageForm: '片剂',
        quantity: 3,
        unit: '盒',
        expiryDate: DateTime(2026, 6, 1),
        lowStockThreshold: 1,
      ),
    );

    final next = await repository.loadState();
    final status = const ReminderEngine()
        .statusFor(next.batches.single, DateTime(2026, 5, 23));
    expect(status, MedicineStatus.expiringSoon);
  });

  test('deleting medicine deletes its batches', () async {
    final state = await repository.loadState();
    await repository.addMedicine(
      MedicineEntry(
        memberId: state.selectedMemberId,
        name: '待删除药',
        specification: '1盒',
        dosageForm: '胶囊',
        quantity: 1,
        unit: '盒',
        expiryDate: DateTime(2027),
        lowStockThreshold: 1,
      ),
    );
    final withMedicine = await repository.loadState();

    await repository.deleteMedicine(withMedicine.medicines.single.id);

    final next = await repository.loadState();
    expect(next.medicines, isEmpty);
    expect(next.batches, isEmpty);
  });

  test('added visit can be read with document summary', () async {
    final state = await repository.loadState();

    await repository.addVisit(
      VisitEntry(
        memberId: state.selectedMemberId,
        visitDate: DateTime(2026, 5, 23),
        diagnosisSummary: '复诊',
        documentSummary: '血常规正常',
      ),
    );

    final next = await repository.loadState();
    expect(next.visits.single.diagnosisSummary, '复诊');
    expect(next.visits.single.hospitalName, isNull);
    expect(next.visits.single.department, isNull);
    expect(next.visits.single.doctorName, isNull);
    expect(next.documents.single.summary, '血常规正常');
    expect(next.visits.single.documentIds, [next.documents.single.id]);
  });
}
