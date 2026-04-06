import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/utils/date_formatters.dart';
import '../../../domain/models/medicine_item.dart';
import '../../../domain/models/model_enums.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_card.dart';
import '../../../shared/widgets/status_chip.dart';
import 'medicine_detail_screen.dart';

class MedicineListScreen extends ConsumerWidget {
  const MedicineListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicinesAsync = ref.watch(medicineItemsProvider);

    return medicinesAsync.when(
      data: (items) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            SectionCard(
              title: '家庭药箱',
              subtitle: '按提醒优先级和最近更新时间排序',
              trailing: FilledButton.tonalIcon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('拍照录入入口已预留，待接入相机与识别链路。')),
                  );
                },
                icon: const Icon(Icons.camera_alt_outlined, size: 18),
                label: const Text('拍照录入'),
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _FilterPill(label: '全部 ${items.length}'),
                  _FilterPill(
                    label:
                        '即将过期 ${items.where((item) => item.displayStatus == MedicineBatchStatus.expiringSoon).length}',
                  ),
                  _FilterPill(
                    label:
                        '库存不足 ${items.where((item) => item.displayStatus == MedicineBatchStatus.lowStock).length}',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (items.isEmpty)
              const EmptyState(
                icon: Icons.medication_outlined,
                title: '当前成员还没有药品',
                message: '首个 MVP 已为药品、批次、图片和提醒边界预留好结构。',
              )
            else
              for (final item in items) ...[
                _MedicineCard(item: item),
                const SizedBox(height: 12),
              ],
          ],
        );
      },
      error: (_, __) => const Center(child: Text('药品数据加载失败')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _MedicineCard extends StatelessWidget {
  const _MedicineCard({required this.item});

  final MedicineItem item;

  @override
  Widget build(BuildContext context) {
    final nearestExpiry = item.nearestExpiryDate;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => MedicineDetailScreen(medicine: item),
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
                          item.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${item.specification} · ${item.dosageForm}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.black54,
                              ),
                        ),
                      ],
                    ),
                  ),
                  StatusChip.forMedicineStatus(item.displayStatus),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _MetaBadge(
                    label: '库存',
                    value:
                        '${item.totalQuantity}${item.batches.isEmpty ? '' : item.batches.first.unit}',
                  ),
                  _MetaBadge(
                    label: '最近有效期',
                    value: nearestExpiry == null ? '未填写' : formatShortDate(nearestExpiry),
                  ),
                  _MetaBadge(label: '批次', value: '${item.batches.length}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterPill extends StatelessWidget {
  const _FilterPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E8D7),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w700),
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
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 2),
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
