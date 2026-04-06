import 'model_enums.dart';

class ReminderItem {
  const ReminderItem({
    required this.id,
    required this.memberId,
    required this.relatedRecordId,
    required this.kind,
    required this.title,
    required this.description,
    required this.triggerDate,
  });

  final String id;
  final String memberId;
  final String relatedRecordId;
  final ReminderKind kind;
  final String title;
  final String description;
  final DateTime triggerDate;
}

