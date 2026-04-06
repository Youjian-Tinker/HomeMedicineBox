import '../models/family_member.dart';
import '../models/medicine_batch.dart';
import '../models/medicine_item.dart';
import '../models/visit_record.dart';

abstract class LocalRepository {
  Future<List<FamilyMember>> listFamilyMembers();

  Future<FamilyMember?> getFamilyMember(String id);

  Future<void> upsertFamilyMember(FamilyMember member);

  Future<List<MedicineItem>> listMedicineItems({
    String? memberId,
    MedicineBatchStatus? status,
  });

  Future<MedicineItem?> getMedicineItem(String id);

  Future<void> saveMedicineItem(MedicineItem medicine);

  Future<List<VisitRecord>> listVisitRecords({String? memberId});

  Future<VisitRecord?> getVisitRecord(String id);

  Future<void> saveVisitRecord(VisitRecord visit);
}

