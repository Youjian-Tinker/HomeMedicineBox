import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_state.dart';
import '../../domain/models.dart';
import '../shared/app_scaffold.dart';

class DraftsScreen extends ConsumerWidget {
  const DraftsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);
    final controller = ref.read(homeStateProvider.notifier);
    final activeDrafts = state.drafts
        .where((draft) =>
            draft.status != DraftStatus.promoted &&
            draft.status != DraftStatus.abandoned &&
            draft.memberId == state.selectedMemberId)
        .toList();

    return AppScaffold(
      title: '草稿箱',
      currentIndex: 3,
      floatingActionButton: FloatingActionButton.extended(
        onPressed:
            state.members.isEmpty ? null : controller.addManualMedicineDraft,
        icon: const Icon(Icons.edit_note_outlined),
        label: const Text('手动补录草稿'),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('草稿确认前不会进入正式药品、就诊列表或提醒计算。'),
          const SizedBox(height: 12),
          if (activeDrafts.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 48),
              child: Center(child: Text('暂无待确认草稿')),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: activeDrafts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final draft = activeDrafts[index];
                return Card(
                  child: ListTile(
                    title: Text(_draftTypeLabel(draft.draftType)),
                    subtitle: Text(_draftStatusLabel(draft.status)),
                    trailing: Wrap(
                      spacing: 8,
                      children: [
                        IconButton(
                          tooltip: '删除',
                          onPressed: () => controller.deleteDraft(draft.id),
                          icon: const Icon(Icons.delete_outline),
                        ),
                        FilledButton(
                          onPressed: () => controller.promoteDraft(draft.id),
                          child: const Text('确认'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  String _draftTypeLabel(DraftType type) {
    return switch (type) {
      DraftType.medicine => '药品草稿',
      DraftType.medicalDocument => '医疗文档草稿',
    };
  }

  String _draftStatusLabel(DraftStatus status) {
    return switch (status) {
      DraftStatus.pending => '待确认',
      DraftStatus.needsInput => '待补充',
      DraftStatus.failed => '识别失败，可手动补录',
      DraftStatus.abandoned => '已放弃',
      DraftStatus.promoted => '已入库',
    };
  }
}
