import 'model_enums.dart';
import 'medicine_batch.dart';

class MedicineItem {
  const MedicineItem({
    required this.id,
    required this.memberId,
    required this.name,
    required this.genericName,
    required this.specification,
    required this.dosageForm,
    required this.category,
    required this.indication,
    required this.storageNotes,
    required this.coverImageAssetId,
    required this.source,
    required this.batches,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String memberId;
  final String name;
  final String? genericName;
  final String specification;
  final String dosageForm;
  final String? category;
  final String? indication;
  final String? storageNotes;
  final String? coverImageAssetId;
  final MedicineSource source;
  final List<MedicineBatch> batches;
  final DateTime createdAt;
  final DateTime updatedAt;

  double get totalQuantity => batches.fold(0, (sum, batch) => sum + batch.quantity);

  DateTime? get nearestExpiryDate {
    if (batches.isEmpty) {
      return null;
    }

    final sorted = [...batches]..sort((a, b) => a.expiryDate.compareTo(b.expiryDate));
    return sorted.first.expiryDate;
  }

  MedicineBatchStatus get displayStatus {
    if (batches.isEmpty) {
      return MedicineBatchStatus.normal;
    }

    final statuses = batches.map((batch) => batch.status).toList();
    if (statuses.contains(MedicineBatchStatus.expired)) {
      return MedicineBatchStatus.expired;
    }
    if (statuses.contains(MedicineBatchStatus.expiringSoon)) {
      return MedicineBatchStatus.expiringSoon;
    }
    if (statuses.contains(MedicineBatchStatus.lowStock)) {
      return MedicineBatchStatus.lowStock;
    }
    if (statuses.every((status) => status == MedicineBatchStatus.consumed)) {
      return MedicineBatchStatus.consumed;
    }
    return MedicineBatchStatus.normal;
  }
}
