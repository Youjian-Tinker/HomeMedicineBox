import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../app/app_state.dart';
import '../../data/local/home_repository.dart';
import '../../domain/models.dart';
import '../shared/app_scaffold.dart';

class VisitsScreen extends ConsumerWidget {
  const VisitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);
    final visits = state.visits
        .where((visit) => visit.memberId == state.selectedMemberId)
        .toList();
    final format = DateFormat('yyyy-MM-dd');

    return AppScaffold(
      title: '就诊档案',
      currentIndex: 2,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: state.members.isEmpty
            ? null
            : () => _showVisitForm(context, ref, state),
        icon: const Icon(Icons.add),
        label: const Text('新增就诊'),
      ),
      child: visits.isEmpty
          ? const Center(child: Text('暂无就诊记录'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: visits.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final visit = visits[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.local_hospital_outlined),
                    title: Text(visit.diagnosisSummary),
                    subtitle: Text(
                      '${format.format(visit.visitDate)} · ${visit.hospitalName ?? '未填写医院'}',
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _showVisitDetail(context, ref, visit.id),
                  ),
                );
              },
            ),
    );
  }
}

Future<void> _showVisitForm(
  BuildContext context,
  WidgetRef ref,
  HomeMedicineState state,
) async {
  final formKey = GlobalKey<FormState>();
  var memberId = state.selectedMemberId;
  var visitDate = DateTime.now();
  final hospitalName = TextEditingController();
  final department = TextEditingController();
  final diagnosisSummary = TextEditingController();
  final doctorName = TextEditingController();
  final documentSummary = TextEditingController();

  await showDialog<void>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('新增就诊'),
            content: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: memberId,
                      decoration: const InputDecoration(labelText: '成员'),
                      items: [
                        for (final member in state.members)
                          DropdownMenuItem(
                            value: member.id,
                            child: Text(member.name),
                          ),
                      ],
                      onChanged: (value) => memberId = value ?? memberId,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('就诊日期'),
                      subtitle:
                          Text(DateFormat('yyyy-MM-dd').format(visitDate)),
                      trailing: const Icon(Icons.calendar_month_outlined),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          initialDate: visitDate,
                        );
                        if (picked != null) {
                          setDialogState(() => visitDate = picked);
                        }
                      },
                    ),
                    TextFormField(
                      controller: hospitalName,
                      decoration: const InputDecoration(labelText: '医院名称'),
                    ),
                    TextFormField(
                      controller: department,
                      decoration: const InputDecoration(labelText: '科室'),
                    ),
                    TextFormField(
                      controller: diagnosisSummary,
                      decoration: const InputDecoration(labelText: '诊断结果摘要'),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                              ? '请填写诊断结果摘要'
                              : null,
                    ),
                    TextFormField(
                      controller: doctorName,
                      decoration: const InputDecoration(labelText: '医生姓名'),
                    ),
                    TextFormField(
                      controller: documentSummary,
                      decoration: const InputDecoration(labelText: '备注/文档摘要'),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('取消'),
              ),
              FilledButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  await ref.read(homeStateProvider.notifier).addVisit(
                        VisitEntry(
                          memberId: memberId,
                          visitDate: visitDate,
                          hospitalName: hospitalName.text,
                          department: department.text,
                          diagnosisSummary: diagnosisSummary.text.trim(),
                          doctorName: doctorName.text,
                          documentSummary: documentSummary.text,
                        ),
                      );
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('保存'),
              ),
            ],
          );
        },
      );
    },
  );
}

Future<void> _showVisitDetail(
  BuildContext context,
  WidgetRef ref,
  String visitId,
) async {
  await showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(homeStateProvider);
          final visit =
              state.visits.where((item) => item.id == visitId).firstOrNull;
          if (visit == null) {
            return const SizedBox.shrink();
          }
          final documents = state.documents
              .where((document) => document.visitRecordId == visit.id)
              .toList();
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(visit.diagnosisSummary,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(DateFormat('yyyy-MM-dd').format(visit.visitDate)),
              Text(visit.hospitalName ?? '未填写医院'),
              if (visit.department != null) Text('科室：${visit.department}'),
              if (visit.doctorName != null) Text('医生：${visit.doctorName}'),
              const Divider(height: 32),
              Text('文档摘要', style: Theme.of(context).textTheme.titleMedium),
              if (documents.isEmpty)
                const Text('未填写文档摘要')
              else
                for (final document in documents) Text(document.summary),
              const SizedBox(height: 16),
              FilledButton.tonalIcon(
                onPressed: () => _confirmDeleteVisit(context, ref, visit),
                icon: const Icon(Icons.delete_outline),
                label: const Text('删除就诊记录'),
              ),
            ],
          );
        },
      );
    },
  );
}

Future<void> _confirmDeleteVisit(
  BuildContext context,
  WidgetRef ref,
  VisitRecord visit,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('删除就诊记录'),
      content: const Text('确认删除这条就诊记录？关联文档也会同步删除。'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('删除'),
        ),
      ],
    ),
  );
  if (confirmed == true) {
    await ref.read(homeStateProvider.notifier).deleteVisit(visit.id);
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
