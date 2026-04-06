import 'package:flutter_test/flutter_test.dart';
import 'package:home_medicine_box/src/data/mock/default_reminder_engine.dart';
import 'package:home_medicine_box/src/data/mock/seed_data.dart';
import 'package:home_medicine_box/src/domain/models/model_enums.dart';

void main() {
  test('builds reminder items from seeded medicines', () async {
    const engine = DefaultReminderEngine();

    final reminders = await engine.buildReminders(
      medicines: SeedData.medicines,
      familyMembers: SeedData.familyMembers,
      now: SeedData.now,
    );

    expect(reminders, isNotEmpty);
    expect(reminders.any((item) => item.kind == ReminderKind.expired), isTrue);
    expect(reminders.any((item) => item.kind == ReminderKind.lowStock), isTrue);
  });
}

