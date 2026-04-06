import '../models/family_member.dart';
import '../models/medicine_item.dart';
import '../models/reminder_item.dart';

abstract class ReminderEngine {
  Future<List<ReminderItem>> buildReminders({
    required List<MedicineItem> medicines,
    required List<FamilyMember> familyMembers,
    DateTime? now,
  });
}

