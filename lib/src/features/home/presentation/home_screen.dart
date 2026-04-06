import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/utils/date_formatters.dart';
import '../../../domain/models/family_member.dart';
import '../../../domain/models/medicine_item.dart';
import '../../../domain/models/model_enums.dart';
import '../../../domain/models/recognition_draft.dart';
import '../../../domain/models/reminder_item.dart';
import '../../../domain/models/visit_record.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_card.dart';
import '../../../shared/widgets/status_chip.dart';
import '../../drafts/presentation/drafts_screen.dart';
import '../../medicines/presentation/medicine_detail_screen.dart';
import '../../visits/presentation/visit_detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membersAsync = ref.watch(familyMembersProvider);
    final medicinesAsync = ref.watch(medicineItemsProvider);
    final visitsAsync = ref.watch(visitRecordsProvider);
    final draftsAsync = ref.watch(draftsProvider);
    final remindersAsync = ref.watch(remindersProvider);
    final selectedMemberId = ref.watch(selectedMemberIdProvider);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        membersAsync.when(
          data: (members) {
            final currentMember = _selectedMember(members, selectedMemberId);
            return _HeroPanel(
              memberName: currentMember?.name ?? '当前成员',
              subtitle: '本地优先保存药品、就诊记录和 AI 草稿',
            );
          },
          error: (_, __) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
        ),
        const SizedBox(height: 20),
        SectionCard(
          title: '今日提醒',
          subtitle: '只展示已入库正式记录',
          child: remindersAsync.when(
            data: (items) => _ReminderContent(items: items),
            error: (_, __) => const Text('提醒加载失败'),
            loading: () => const _LoadingBlock(),
          ),
        ),
        const SizedBox(height: 16),
        SectionCard(
          title: '最近新增药品',
          trailing: TextButton.icon(
            onPressed: () => _showComingSoon(context, '拍照录药流程'),
            icon: const Icon(Icons.camera_alt_outlined, size: 18),
            label: const Text('拍照录药'),
          ),
          child: medicinesAsync.when(
            data: (items) => _MedicinePreviewList(items: items),
            error: (_, __) => const Text('药品加载失败'),
            loading: () => const _LoadingBlock(),
          ),
        ),
        const SizedBox(height: 16),
        SectionCard(
          title: '最近就诊记录',
          trailing: TextButton.icon(
            onPressed: () => _showComingSoon(context, '新增就诊流程'),
            icon: const Icon(Icons.note_add_outlined, size: 18),
            label: const Text('新增就诊'),
          ),
          child: visitsAsync.when(
            data: (items) => _VisitPreviewList(items: items),
            error: (_, __) => const Text('就诊记录加载失败'),
            loading: () => const _LoadingBlock(),
          ),
        ),
        const SizedBox(height: 16),
        SectionCard(
          title: '待确认草稿',
          trailing: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const DraftsScreen()),
              );
            },
            child: const Text('查看全部'),
          ),
          child: draftsAsync.when(
            data: (items) => _DraftPreviewList(items: items),
            error: (_, __) => const Text('草稿加载失败'),
            loading: () => const _LoadingBlock(),
          ),
        ),
      ],
    );
  }

  FamilyMember? _selectedMember(List<FamilyMember> members, String? selectedMemberId) {
    for (final member in members) {
      if (member.id == selectedMemberId) {
        return member;
      }
    }
    return members.isEmpty ? null : members.first;
  }

  void _showComingSoon(BuildContext context, String featureName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$featureName 已预留入口，后续接入相机和识别服务后启用。')),
    );
  }
}

class _HeroPanel extends StatelessWidget {
  const _HeroPanel({
    required this.memberName,
    required this.subtitle,
  });

  final String memberName;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF245D54), Color(0xFF4B887E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.14),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              memberName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            '用一部手机管理全家药箱和就诊资料',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              height: 1.25,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _ReminderContent extends StatelessWidget {
  const _ReminderContent({required this.items});

  final List<ReminderItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const EmptyState(
        icon: Icons.check_circle_outline,
        title: '当前没有紧急提醒',
        message: '药品状态看起来不错，后续有新提醒会优先出现在这里。',
      );
    }

    return Column(
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _MetricBadge(
              label: '提醒总数',
              value: items.length.toString(),
            ),
            _MetricBadge(
              label: '已过期',
              value: items
                  .where((item) => item.kind == ReminderKind.expired)
                  .length
                  .toString(),
            ),
            _MetricBadge(
              label: '库存不足',
              value: items
                  .where((item) => item.kind == ReminderKind.lowStock)
                  .length
                  .toString(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        for (final item in items.take(3)) ...[
          _ReminderTile(item: item),
          if (item != items.take(3).last) const Divider(height: 20),
        ],
      ],
    );
  }
}

class _ReminderTile extends StatelessWidget {
  const _ReminderTile({required this.item});

  final ReminderItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatusChip.forReminder(item.kind),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                item.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black54,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MedicinePreviewList extends StatelessWidget {
  const _MedicinePreviewList({required this.items});

  final List<MedicineItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const EmptyState(
        icon: Icons.medication_outlined,
        title: '当前成员还没有药品',
        message: '可以从首页快捷入口进入拍照录药，先把家庭常备药录进来。',
      );
    }

    return Column(
      children: [
        for (final item in items.take(3)) ...[
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(item.name),
            subtitle: Text(
              '${item.specification} · 剩余 ${item.totalQuantity}${item.batches.isEmpty ? '' : item.batches.first.unit}',
            ),
            trailing: StatusChip.forMedicineStatus(item.displayStatus),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => MedicineDetailScreen(medicine: item),
                ),
              );
            },
          ),
          if (item != items.take(3).last) const Divider(height: 1),
        ],
      ],
    );
  }
}

class _VisitPreviewList extends StatelessWidget {
  const _VisitPreviewList({required this.items});

  final List<VisitRecord> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const EmptyState(
        icon: Icons.receipt_long_outlined,
        title: '当前成员还没有就诊记录',
        message: '拍摄处方单、检查单或诊断书后，就诊档案会自动归到这里。',
      );
    }

    return Column(
      children: [
        for (final item in items.take(3)) ...[
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(item.diagnosisSummary),
            subtitle: Text(
              '${formatShortDate(item.visitDate)} · ${item.hospitalName ?? '未填写医院'} · ${item.department ?? '未填写科室'}',
            ),
            trailing: Text('${item.documentCount} 份文档'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => VisitDetailScreen(visit: item),
                ),
              );
            },
          ),
          if (item != items.take(3).last) const Divider(height: 1),
        ],
      ],
    );
  }
}

class _DraftPreviewList extends StatelessWidget {
  const _DraftPreviewList({required this.items});

  final List<RecognitionDraft> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const EmptyState(
        icon: Icons.inventory_2_outlined,
        title: '暂无待确认草稿',
        message: 'AI 识别结果会先进入草稿箱，确认后才会正式入库。',
      );
    }

    return Column(
      children: [
        for (final draft in items.take(2)) ...[
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('${draft.draftType.label}草稿'),
            subtitle: Text('最近更新时间 ${formatShortDate(draft.updatedAt)}'),
            trailing: StatusChip.forDraftStatus(draft.status),
          ),
          if (draft != items.take(2).last) const Divider(height: 1),
        ],
      ],
    );
  }
}

class _MetricBadge extends StatelessWidget {
  const _MetricBadge({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F1E7),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
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

class _LoadingBlock extends StatelessWidget {
  const _LoadingBlock();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 96,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
