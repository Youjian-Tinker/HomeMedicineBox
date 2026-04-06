import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/utils/date_formatters.dart';
import '../../../domain/models/recognition_draft.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_card.dart';
import '../../../shared/widgets/status_chip.dart';
import 'draft_detail_screen.dart';

class DraftsScreen extends ConsumerWidget {
  const DraftsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draftsAsync = ref.watch(draftsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('草稿箱')),
      body: draftsAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(20),
              child: EmptyState(
                icon: Icons.inventory_2_outlined,
                title: '暂无草稿',
                message: '拍照识别后，这里会先展示草稿供用户确认，再决定是否正式入库。',
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SectionCard(
                title: '识别草稿规则',
                subtitle: '草稿未确认前，不进入正式记录，也不参与提醒计算',
                child: Text('当前实现里已经把 DraftRepository 和 RecognitionProvider 的边界独立出来。'),
              ),
              const SizedBox(height: 16),
              for (final draft in items) ...[
                _DraftCard(draft: draft),
                const SizedBox(height: 12),
              ],
            ],
          );
        },
        error: (_, __) => const Center(child: Text('草稿加载失败')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _DraftCard extends StatelessWidget {
  const _DraftCard({required this.draft});

  final RecognitionDraft draft;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => DraftDetailScreen(draft: draft),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${draft.draftType.label}草稿',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '更新时间 ${formatShortDate(draft.updatedAt)} · ${draft.imageAssetIds.length} 张图片',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.black54,
                              ),
                        ),
                      ],
                    ),
                  ),
                  StatusChip.forDraftStatus(draft.status),
                ],
              ),
              if (draft.missingFields.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  '待补充字段：${draft.missingFields.join('、')}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

