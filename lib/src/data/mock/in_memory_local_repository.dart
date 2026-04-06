import '../../domain/models/family_member.dart';
import '../../domain/models/medicine_batch.dart';
import '../../domain/models/medicine_item.dart';
import '../../domain/models/visit_record.dart';
import '../../domain/repositories/local_repository.dart';
import 'seed_data.dart';

class InMemoryLocalRepository implements LocalRepository {
  InMemoryLocalRepository._({
    required List<FamilyMember> members,
    required List<MedicineItem> medicines,
    required List<VisitRecord> visits,
  })  : _members = {for (final member in members) member.id: member},
        _medicines = {for (final medicine in medicines) medicine.id: medicine},
        _visits = {for (final visit in visits) visit.id: visit};

  factory InMemoryLocalRepository.seeded() {
    return InMemoryLocalRepository._(
      members: SeedData.familyMembers,
      medicines: SeedData.medicines,
      visits: SeedData.visitRecords,
    );
  }

  final Map<String, FamilyMember> _members;
  final Map<String, MedicineItem> _medicines;
  final Map<String, VisitRecord> _visits;

  @override
  Future<FamilyMember?> getFamilyMember(String id) async => _members[id];

  @override
  Future<MedicineItem?> getMedicineItem(String id) async => _medicines[id];

  @override
  Future<VisitRecord?> getVisitRecord(String id) async => _visits[id];

  @override
  Future<List<FamilyMember>> listFamilyMembers() async {
    final members = _members.values.toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return members;
  }

  @override
  Future<List<MedicineItem>> listMedicineItems({
    String? memberId,
    MedicineBatchStatus? status,
  }) async {
    var items = _medicines.values.toList();

    if (memberId != null) {
      items = items.where((item) => item.memberId == memberId).toList();
    }

    if (status != null) {
      items = items.where((item) => item.displayStatus == status).toList();
    }

    items.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return items;
  }

  @override
  Future<List<VisitRecord>> listVisitRecords({String? memberId}) async {
    var visits = _visits.values.toList();

    if (memberId != null) {
      visits = visits.where((visit) => visit.memberId == memberId).toList();
    }

    visits.sort((a, b) => b.visitDate.compareTo(a.visitDate));
    return visits;
  }

  @override
  Future<void> saveMedicineItem(MedicineItem medicine) async {
    _medicines[medicine.id] = medicine;
  }

  @override
  Future<void> saveVisitRecord(VisitRecord visit) async {
    _visits[visit.id] = visit;
  }

  @override
  Future<void> upsertFamilyMember(FamilyMember member) async {
    _members[member.id] = member;
  }
}

