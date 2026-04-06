import 'model_enums.dart';

class MedicineBatch {
  const MedicineBatch({
    required this.id,
    required this.medicineItemId,
    required this.quantity,
    required this.unit,
    required this.expiryDate,
    required this.lowStockThreshold,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String medicineItemId;
  final double quantity;
  final String unit;
  final DateTime expiryDate;
  final double lowStockThreshold;
  final MedicineBatchStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicineBatch copyWith({
    String? id,
    String? medicineItemId,
    double? quantity,
    String? unit,
    DateTime? expiryDate,
    double? lowStockThreshold,
    MedicineBatchStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MedicineBatch(
      id: id ?? this.id,
      medicineItemId: medicineItemId ?? this.medicineItemId,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      expiryDate: expiryDate ?? this.expiryDate,
      lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

