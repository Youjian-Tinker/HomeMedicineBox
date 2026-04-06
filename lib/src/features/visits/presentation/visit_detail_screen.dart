import 'package:flutter/material.dart';

import '../../../core/utils/date_formatters.dart';
import '../../../domain/models/visit_record.dart';
import '../../../domain/models/model_enums.dart';
import '../../../shared/widgets/section_card.dart';
import '../../../shared/widgets/status_chip.dart';

class VisitDetailScreen extends StatelessWidget {
  const VisitDetailScreen({
    super.key,
    required this.visit,
  });

  final VisitRecord visit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('就诊详情')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SectionCard(
            title: '事件摘要',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DetailRow(label: '日期', value: formatShortDate(visit.visitDate)),
                _DetailRow(label: '医院', value: visit.hospitalName ?? '未填写'),
                _DetailRow(label: '科室', value: visit.department ?? '未填写'),
                _DetailRow(label: '医生', value: visit.doctorName ?? '未填写'),
                _DetailRow(label: '结论', value: visit.diagnosisSummary),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: '文档列表',
            subtitle: '同一轮拍摄可合并到同一次就诊事件',
            child: Column(
              children: [
                for (final document in visit.documents) ...[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(document.summary),
                    subtitle: Text(document.documentType.label),
                    trailing: StatusChip(
                      label: document.source == MedicineSource.ai ? 'AI识别' : '手动',
                      backgroundColor: const Color(0xFFDDEEE9),
                      foregroundColor: const Color(0xFF245D54),
                    ),
                  ),
                  if (document.keyIndicators != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          document.keyIndicators!,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.black54,
                              ),
                        ),
                      ),
                    ),
                  if (document != visit.documents.last) const Divider(height: 1),
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
