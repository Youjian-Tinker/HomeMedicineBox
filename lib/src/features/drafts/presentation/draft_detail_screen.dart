import 'package:flutter/material.dart';

import '../../../shared/widgets/section_card.dart';
import '../../../shared/widgets/status_chip.dart';
import '../../../domain/models/recognition_draft.dart';

class DraftDetailScreen extends StatelessWidget {
  const DraftDetailScreen({
    super.key,
    required this.draft,
  });

  final RecognitionDraft draft;

  @override
  Widget build(BuildContext context) {
    final entries = draft.recognizedPayload.entries.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('草稿详情')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SectionCard(
            title: '当前状态',
            child: Row(
              children: [
                StatusChip.forDraftStatus(draft.status),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '识别结果只是草稿，确认保存前不会进入正式药品或就诊记录。',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: '识别字段',
            subtitle: '低置信字段应重点复核',
            child: Column(
              children: [
                for (final entry in entries) ...[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(entry.key),
                    subtitle: Text('${entry.value ?? '未识别'}'),
                    trailing: _ConfidenceBadge(
                      confidence: draft.confidenceHints[entry.key],
                    ),
                  ),
                  if (entry != entries.last) const Divider(height: 1),
                ],
              ],
            ),
          ),
          if (draft.missingFields.isNotEmpty) ...[
            const SizedBox(height: 16),
            SectionCard(
              title: '缺失字段',
              child: Text(draft.missingFields.join('、')),
            ),
          ],
        ],
      ),
    );
  }
}

class _ConfidenceBadge extends StatelessWidget {
  const _ConfidenceBadge({required this.confidence});

  final double? confidence;

  @override
  Widget build(BuildContext context) {
    if (confidence == null) {
      return const Text('待确认');
    }

    final percent = (confidence! * 100).round();
    final isLow = confidence! < 0.8;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isLow ? const Color(0xFFFCE6CC) : const Color(0xFFDDEEE9),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        '$percent%',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: isLow ? const Color(0xFF925819) : const Color(0xFF245D54),
        ),
      ),
    );
  }
}

