import 'package:flutter_test/flutter_test.dart';
import 'package:home_medicine_box/src/domain/models.dart';
import 'package:home_medicine_box/src/domain/reminder_engine.dart';

void main() {
  test('medicine batch reminder status uses local date and stock threshold',
      () {
    const engine = ReminderEngine();
    final today = DateTime(2026, 5, 23);

    final expired =
        _batch('expired', 2, today.subtract(const Duration(days: 1)));
    final lowStock = _batch('low', 1, today.add(const Duration(days: 90)));
    final expiring = _batch('soon', 3, today.add(const Duration(days: 10)));
    final normal = _batch('normal', 3, today.add(const Duration(days: 90)));

    expect(engine.statusFor(expired, today), MedicineStatus.expired);
    expect(engine.statusFor(lowStock, today), MedicineStatus.lowStock);
    expect(engine.statusFor(expiring, today), MedicineStatus.expiringSoon);
    expect(engine.statusFor(normal, today), MedicineStatus.normal);
  });
}

MedicineBatch _batch(String id, double quantity, DateTime expiryDate) {
  return MedicineBatch(
    id: id,
    medicineItemId: 'medicine',
    quantity: quantity,
    unit: '盒',
    expiryDate: expiryDate,
    lowStockThreshold: 1,
  );
}
