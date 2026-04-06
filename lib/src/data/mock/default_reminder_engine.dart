import '../../core/utils/date_formatters.dart';
import '../../domain/models/family_member.dart';
import '../../domain/models/medicine_batch.dart';
import '../../domain/models/medicine_item.dart';
import '../../domain/models/model_enums.dart';
import '../../domain/models/reminder_item.dart';
import '../../domain/services/reminder_engine.dart';

class DefaultReminderEngine implements ReminderEngine {
  const DefaultReminderEngine();

  @override
  Future<List<ReminderItem>> buildReminders({
    required List<MedicineItem> medicines,
    required List<FamilyMember> familyMembers,
    DateTime? now,
  }) async {
    final current = now ?? DateTime.now();
    final items = <ReminderItem>[];

    for (final medicine in medicines) {
      for (final batch in medicine.batches) {
        if (_isExpired(batch, current)) {
          items.add(
            ReminderItem(
              id: '${medicine.id}-${batch.id}-expired',
              memberId: medicine.memberId,
              relatedRecordId: medicine.id,
              kind: ReminderKind.expired,
              title: '${medicine.name} 已过期',
              description: '批次 ${batch.unit} 库存 ${batch.quantity}，有效期 ${formatShortDate(batch.expiryDate)}',
              triggerDate: batch.expiryDate,
            ),
          );
        } else if (_isExpiringSoon(batch, current)) {
          items.add(
            ReminderItem(
              id: '${medicine.id}-${batch.id}-expiring',
              memberId: medicine.memberId,
              relatedRecordId: medicine.id,
              kind: ReminderKind.expiringSoon,
              title: '${medicine.name} 即将过期',
              description: '距离到期 ${daysBetween(current, batch.expiryDate)} 天',
              triggerDate: batch.expiryDate,
            ),
          );
        }

        if (_isLowStock(batch)) {
          items.add(
            ReminderItem(
              id: '${medicine.id}-${batch.id}-stock',
              memberId: medicine.memberId,
              relatedRecordId: medicine.id,
              kind: ReminderKind.lowStock,
              title: '${medicine.name} 库存不足',
              description: '当前 ${batch.quantity}${batch.unit}，低于阈值 ${batch.lowStockThreshold}${batch.unit}',
              triggerDate: current,
            ),
          );
        }
      }
    }

    items.sort((a, b) {
      final severity = _severityRank(a.kind).compareTo(_severityRank(b.kind));
      if (severity != 0) {
        return severity;
      }
      return a.triggerDate.compareTo(b.triggerDate);
    });
    return items;
  }

  bool _isExpired(MedicineBatch batch, DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    final expiry = DateTime(batch.expiryDate.year, batch.expiryDate.month, batch.expiryDate.day);
    return expiry.isBefore(today);
  }

  bool _isExpiringSoon(MedicineBatch batch, DateTime now) {
    final remainingDays = daysBetween(now, batch.expiryDate);
    return remainingDays >= 0 && remainingDays <= 30;
  }

  bool _isLowStock(MedicineBatch batch) {
    return batch.quantity > 0 && batch.quantity <= batch.lowStockThreshold;
  }

  int _severityRank(ReminderKind kind) {
    switch (kind) {
      case ReminderKind.expired:
        return 0;
      case ReminderKind.expiringSoon:
        return 1;
      case ReminderKind.lowStock:
        return 2;
    }
  }
}

