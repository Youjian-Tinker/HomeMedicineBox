import 'package:flutter/material.dart';

import '../../../core/utils/date_formatters.dart';
import '../../../domain/models/medicine_item.dart';
import '../../../domain/models/model_enums.dart';
import '../../../shared/widgets/section_card.dart';
import '../../../shared/widgets/status_chip.dart';

class MedicineDetailScreen extends StatelessWidget {
  const MedicineDetailScreen({
    super.key,
    required this.medicine,
  });

  final MedicineItem medicine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(medicine.name)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SectionCard(
            title: '基础信息',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DetailRow(label: '规格', value: medicine.specification),
                _DetailRow(label: '剂型', value: medicine.dosageForm),
                _DetailRow(label: '用途', value: medicine.indication ?? '未填写'),
                _DetailRow(label: '储存说明', value: medicine.storageNotes ?? '未填写'),
                _DetailRow(
                  label: '录入来源',
                  value: medicine.source == MedicineSource.ai ? 'AI 识别' : '手动录入',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: '批次信息',
            subtitle: '库存扣减时应优先使用最早过期批次',
            child: Column(
              children: [
                for (final batch in medicine.batches) ...[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('${batch.quantity}${batch.unit}'),
                    subtitle: Text('有效期 ${formatShortDate(batch.expiryDate)}'),
                    trailing: StatusChip.forMedicineStatus(batch.status),
                  ),
                  if (batch != medicine.batches.last) const Divider(height: 1),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 72,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
