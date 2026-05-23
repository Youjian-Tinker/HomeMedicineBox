import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/app_state.dart';
import '../../domain/models.dart';
import '../shared/app_scaffold.dart';
import '../shared/section_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);
    final controller = ref.read(homeStateProvider.notifier);
    final reminders = ref
        .watch(reminderEngineProvider)
        .remindersFor(state.batches, DateTime.now());
    final selectedMember = state.members.firstWhere(
      (member) => member.id == state.selectedMemberId,
    );

    return AppScaffold(
      title: 'HomeMedicineBox',
      currentIndex: 0,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DropdownButtonFormField<String>(
            initialValue: selectedMember.id,
            decoration: const InputDecoration(
              labelText: '当前成员',
              border: OutlineInputBorder(),
            ),
            items: [
              for (final member in state.members)
                DropdownMenuItem(value: member.id, child: Text(member.name)),
            ],
            onChanged: (value) {
              if (value != null) {
                controller.selectMember(value);
              }
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: controller.addManualMedicineDraft,
                  icon: const Icon(Icons.add_a_photo_outlined),
                  label: const Text('拍照录药'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => context.go('/visits'),
                  icon: const Icon(Icons.note_add_outlined),
                  label: const Text('新增就诊'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: '今日提醒',
            trailing: TextButton(
              onPressed: () => context.go('/medicines'),
              child: const Text('查看'),
            ),
            child: reminders.isEmpty
                ? const Text('当前没有紧急提醒。')
                : Column(
                    children: [
                      for (final reminder in reminders)
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading:
                              const Icon(Icons.notifications_active_outlined),
                          title: Text(_statusLabel(reminder.status)),
                          subtitle: Text(
                            '批次 ${reminder.batch.id} · ${reminder.batch.quantity}${reminder.batch.unit}',
                          ),
                        ),
                    ],
                  ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: '最近药品',
            child: Column(
              children: [
                for (final medicine in state.medicines.take(3))
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(medicine.name),
                    subtitle: Text(
                        '${medicine.specification} · ${medicine.dosageForm}'),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: '待确认草稿',
            trailing: TextButton(
              onPressed: () => context.go('/drafts'),
              child: Text(
                  '${state.drafts.where((draft) => draft.status != DraftStatus.promoted).length} 条'),
            ),
            child: const Text('AI 识别和手动补录内容必须确认后才会进入正式记录。'),
          ),
        ],
      ),
    );
  }

  String _statusLabel(MedicineStatus status) {
    return switch (status) {
      MedicineStatus.expired => '已有药品过期',
      MedicineStatus.lowStock => '库存不足',
      MedicineStatus.expiringSoon => '即将过期',
      MedicineStatus.usedUp => '已用完',
      MedicineStatus.normal => '正常',
    };
  }
}
