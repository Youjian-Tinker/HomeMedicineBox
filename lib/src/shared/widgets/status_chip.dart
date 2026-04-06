import 'package:flutter/material.dart';

import '../../domain/models/model_enums.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final String label;
  final Color backgroundColor;
  final Color foregroundColor;

  factory StatusChip.forMedicineStatus(MedicineBatchStatus status) {
    switch (status) {
      case MedicineBatchStatus.normal:
        return const StatusChip(
          label: '正常',
          backgroundColor: Color(0xFFDDEEE9),
          foregroundColor: Color(0xFF245D54),
        );
      case MedicineBatchStatus.expiringSoon:
        return const StatusChip(
          label: '即将过期',
          backgroundColor: Color(0xFFFCE6CC),
          foregroundColor: Color(0xFF925819),
        );
      case MedicineBatchStatus.expired:
        return const StatusChip(
          label: '已过期',
          backgroundColor: Color(0xFFF7D6D7),
          foregroundColor: Color(0xFF8B2C32),
        );
      case MedicineBatchStatus.lowStock:
        return const StatusChip(
          label: '库存不足',
          backgroundColor: Color(0xFFF5E7B2),
          foregroundColor: Color(0xFF775600),
        );
      case MedicineBatchStatus.consumed:
        return const StatusChip(
          label: '已用完',
          backgroundColor: Color(0xFFE8E4E0),
          foregroundColor: Color(0xFF5E5A57),
        );
    }
  }

  factory StatusChip.forDraftStatus(DraftStatus status) {
    switch (status) {
      case DraftStatus.pendingReview:
        return const StatusChip(
          label: '待确认',
          backgroundColor: Color(0xFFDDEEE9),
          foregroundColor: Color(0xFF245D54),
        );
      case DraftStatus.needsMoreInfo:
        return const StatusChip(
          label: '待补充',
          backgroundColor: Color(0xFFFCE6CC),
          foregroundColor: Color(0xFF925819),
        );
      case DraftStatus.failed:
        return const StatusChip(
          label: '识别失败',
          backgroundColor: Color(0xFFF7D6D7),
          foregroundColor: Color(0xFF8B2C32),
        );
      case DraftStatus.discarded:
        return const StatusChip(
          label: '已放弃',
          backgroundColor: Color(0xFFE8E4E0),
          foregroundColor: Color(0xFF5E5A57),
        );
      case DraftStatus.promoted:
        return const StatusChip(
          label: '已转正',
          backgroundColor: Color(0xFFDDEEE9),
          foregroundColor: Color(0xFF245D54),
        );
    }
  }

  factory StatusChip.forReminder(ReminderKind kind) {
    switch (kind) {
      case ReminderKind.expiringSoon:
        return const StatusChip(
          label: '即将过期',
          backgroundColor: Color(0xFFFCE6CC),
          foregroundColor: Color(0xFF925819),
        );
      case ReminderKind.expired:
        return const StatusChip(
          label: '已过期',
          backgroundColor: Color(0xFFF7D6D7),
          foregroundColor: Color(0xFF8B2C32),
        );
      case ReminderKind.lowStock:
        return const StatusChip(
          label: '库存不足',
          backgroundColor: Color(0xFFF5E7B2),
          foregroundColor: Color(0xFF775600),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foregroundColor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

