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
    if (state.members.isEmpty) {
      return const AppScaffold(
        title: 'HomeMedicineBox',
        currentIndex: 0,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final controller = ref.read(homeStateProvider.notifier);
    final selectedMember = state.members.firstWhere(
      (member) => member.id == state.selectedMemberId,
      orElse: () => state.members.first,
    );
    final sharedMemberId = state.members
        .firstWhere((member) => member.isSystemDefault,
            orElse: () => state.members.first)
        .id;
    final visibleMedicines = state.medicines
        .where((medicine) =>
            medicine.memberId == selectedMember.id ||
            (selectedMember.id != sharedMemberId &&
                medicine.memberId == sharedMemberId))
        .toList();
    final visibleMedicineIds = visibleMedicines.map((item) => item.id).toSet();
    final visibleBatches = state.batches
        .where((batch) => visibleMedicineIds.contains(batch.medicineItemId))
        .toList();
    final visibleVisits = state.visits
        .where((visit) => visit.memberId == selectedMember.id)
        .toList();
    final activeDrafts = state.drafts
        .where((draft) =>
            draft.status != DraftStatus.promoted &&
            draft.status != DraftStatus.abandoned &&
            draft.memberId == selectedMember.id)
        .toList();
    final engine = ref.watch(reminderEngineProvider);
    final reminders = visibleBatches
        .map((batch) => engine.statusFor(batch, DateTime.now()))
        .toList();

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
                  onPressed: () => context.go('/medicines'),
                  icon: const Icon(Icons.medication_outlined),
                  label: const Text('新增药品'),
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
            title: '首页统计',
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _StatChip(
                  label: '即将过期',
                  value: reminders
                      .where((status) => status == MedicineStatus.expiringSoon)
                      .length,
                ),
                _StatChip(
                  label: '已过期',
                  value: reminders
                      .where((status) => status == MedicineStatus.expired)
                      .length,
                ),
                _StatChip(
                  label: '库存不足',
                  value: reminders
                      .where((status) =>
                          status == MedicineStatus.lowStock ||
                          status == MedicineStatus.usedUp)
                      .length,
                ),
                _StatChip(label: '待确认草稿', value: activeDrafts.length),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: '今日提醒',
            trailing: TextButton(
              onPressed: () => context.go('/medicines'),
              child: const Text('查看'),
            ),
            child: ref
                    .watch(reminderEngineProvider)
                    .remindersFor(visibleBatches, DateTime.now())
                    .isEmpty
                ? const Text('当前没有紧急提醒。')
                : Column(
                    children: [
                      for (final reminder in ref
                          .watch(reminderEngineProvider)
                          .remindersFor(visibleBatches, DateTime.now()))
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
            child: visibleMedicines.isEmpty
                ? const Text('暂无药品')
                : Column(
                    children: [
                      for (final medicine in visibleMedicines.take(3))
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
            title: '最近就诊',
            child: visibleVisits.isEmpty
                ? const Text('暂无就诊记录')
                : Column(
                    children: [
                      for (final visit in visibleVisits.take(3))
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(visit.diagnosisSummary),
                          subtitle: Text(visit.hospitalName ?? '未填写医院'),
                        ),
                    ],
                  ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: '待确认草稿',
            trailing: TextButton(
              onPressed: () => context.go('/drafts'),
              child: Text('${activeDrafts.length} 条'),
            ),
            child: const Text('草稿确认前不会进入正式记录和提醒计算。'),
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

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text('$label $value'));
  }
}
