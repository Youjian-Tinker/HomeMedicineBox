import 'models.dart';

class MedicineReminder {
  const MedicineReminder({
    required this.batch,
    required this.status,
  });

  final MedicineBatch batch;
  final MedicineStatus status;
}

class ReminderEngine {
  const ReminderEngine({this.expiringSoonDays = 30});

  final int expiringSoonDays;

  MedicineStatus statusFor(MedicineBatch batch, DateTime today) {
    final date = DateTime(today.year, today.month, today.day);
    final expiry = DateTime(
      batch.expiryDate.year,
      batch.expiryDate.month,
      batch.expiryDate.day,
    );

    if (batch.quantity <= 0) {
      return MedicineStatus.usedUp;
    }
    if (expiry.isBefore(date)) {
      return MedicineStatus.expired;
    }
    if (batch.quantity <= batch.lowStockThreshold) {
      return MedicineStatus.lowStock;
    }
    if (!expiry.isAfter(date.add(Duration(days: expiringSoonDays)))) {
      return MedicineStatus.expiringSoon;
    }
    return MedicineStatus.normal;
  }

  List<MedicineReminder> remindersFor(
    List<MedicineBatch> batches,
    DateTime today,
  ) {
    return batches
        .map((batch) =>
            MedicineReminder(batch: batch, status: statusFor(batch, today)))
        .where((reminder) => reminder.status != MedicineStatus.normal)
        .toList()
      ..sort((a, b) => _rank(a.status).compareTo(_rank(b.status)));
  }

  int _rank(MedicineStatus status) {
    return switch (status) {
      MedicineStatus.expired => 0,
      MedicineStatus.lowStock => 1,
      MedicineStatus.expiringSoon => 2,
      MedicineStatus.usedUp => 3,
      MedicineStatus.normal => 4,
    };
  }
}
