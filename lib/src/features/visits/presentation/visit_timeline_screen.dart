import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/utils/date_formatters.dart';
import '../../../domain/models/model_enums.dart';
import '../../../domain/models/visit_record.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_card.dart';
import 'visit_detail_screen.dart';

class VisitTimelineScreen extends ConsumerWidget {
  const VisitTimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitsAsync = ref.watch(visitRecordsProvider);

    return visitsAsync.when(
      data: (items) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            const SectionCard(
              title: '就诊时间线',
              subtitle: '按日期倒序展示，一次就诊可挂多份文档',
              child: Text('后续可在这里接入筛选、补录文档、处方药同步入药箱等能力。'),
            ),
            const SizedBox(height: 16),
            if (items.isEmpty)
              const EmptyState(
                icon: Icons.receipt_long_outlined,
                title: '还没有就诊记录',
                message: '当前工程已经预留 VisitRecord 和 MedicalDocumentRecord 的结构。',
              )
            else
              for (final visit in items) ...[
                _VisitCard(visit: visit),
                const SizedBox(height: 12),
              ],
          ],
        );
      },
      error: (_, __) => const Center(child: Text('就诊档案加载失败')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _VisitCard extends StatelessWidget {
  const _VisitCard({required this.visit});

  final VisitRecord visit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => VisitDetailScreen(visit: visit),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatShortDate(visit.visitDate),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                visit.diagnosisSummary,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '${visit.hospitalName ?? '未填写医院'} · ${visit.department ?? '未填写科室'}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black54,
                    ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _MetaBadge(label: '文档数', value: '${visit.documentCount}'),
                  _MetaBadge(
                    label: '状态',
                    value: visit.status == VisitStatus.archived ? '已建档' : '待补资料',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaBadge extends StatelessWidget {
  const _MetaBadge({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF9F1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black54,
                ),
          ),
        ],
      ),
    );
  }
}
