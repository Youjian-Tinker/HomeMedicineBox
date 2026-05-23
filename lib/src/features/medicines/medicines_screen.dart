import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../app/app_state.dart';
import '../../data/local/home_repository.dart';
import '../../domain/models.dart';
import '../../domain/reminder_engine.dart';
import '../shared/app_scaffold.dart';

class MedicinesScreen extends ConsumerWidget {
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);
    final selectedMemberId = state.selectedMemberId;
    final sharedMemberId = _sharedMemberId(state);
    final medicines = state.medicines
        .where((medicine) =>
            medicine.memberId == selectedMemberId ||
            (selectedMemberId != sharedMemberId &&
                medicine.memberId == sharedMemberId))
        .toList();

    return AppScaffold(
      title: '药品',
      currentIndex: 1,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: state.members.isEmpty
            ? null
            : () => _showMedicineForm(context, ref, state),
        icon: const Icon(Icons.add),
        label: const Text('新增药品'),
      ),
      child: medicines.isEmpty
          ? const Center(child: Text('暂无药品'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: medicines.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                final batches = state.batches
                    .where((batch) => batch.medicineItemId == medicine.id)
                    .toList();
                final reminders = ref
                    .watch(reminderEngineProvider)
                    .remindersFor(batches, DateTime.now());
                return Card(
                  child: ListTile(
                    title: Text(medicine.name),
                    subtitle: Text(
                      '${medicine.specification} · ${batches.length} 个批次 · ${_summaryStatus(reminders)}',
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _showMedicineDetail(context, ref, medicine.id),
                  ),
                );
              },
            ),
    );
  }

  String _sharedMemberId(HomeMedicineState state) {
    return state.members
        .firstWhere(
          (member) => member.isSystemDefault,
          orElse: () => state.members.first,
        )
        .id;
  }

  String _summaryStatus(List<MedicineReminder> reminders) {
    if (reminders.isEmpty) {
      return '正常';
    }
    return _statusLabel(reminders.first.status);
  }
}

Future<void> _showMedicineForm(
  BuildContext context,
  WidgetRef ref,
  HomeMedicineState state, {
  MedicineItem? medicine,
}) async {
  final formKey = GlobalKey<FormState>();
  var memberId = medicine?.memberId ?? state.selectedMemberId;
  final name = TextEditingController(text: medicine?.name ?? '');
  final specification =
      TextEditingController(text: medicine?.specification ?? '');
  final dosageForm = TextEditingController(text: medicine?.dosageForm ?? '片剂');
  final quantity = TextEditingController(text: '1');
  final unit = TextEditingController(text: '盒');
  final lowStockThreshold = TextEditingController(text: '1');
  final indication = TextEditingController(text: medicine?.indication ?? '');
  final storageNotes =
      TextEditingController(text: medicine?.storageNotes ?? '');
  var expiryDate = DateTime.now().add(const Duration(days: 180));

  await showDialog<void>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text(medicine == null ? '新增药品' : '编辑药品'),
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
                      onChanged: medicine == null
                          ? (value) => memberId = value ?? memberId
                          : null,
                    ),
                    _requiredField(name, '药品名称'),
                    _requiredField(specification, '规格'),
                    _requiredField(dosageForm, '剂型'),
                    if (medicine == null) ...[
                      _numberField(quantity, '数量'),
                      _requiredField(unit, '单位'),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('有效期'),
                        subtitle:
                            Text(DateFormat('yyyy-MM-dd').format(expiryDate)),
                        trailing: const Icon(Icons.calendar_month_outlined),
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            initialDate: expiryDate,
                          );
                          if (picked != null) {
                            setDialogState(() => expiryDate = picked);
                          }
                        },
                      ),
                      _numberField(lowStockThreshold, '低库存阈值'),
                    ],
                    TextFormField(
                      controller: indication,
                      decoration: const InputDecoration(labelText: '用途/适应症'),
                    ),
                    TextFormField(
                      controller: storageNotes,
                      decoration: const InputDecoration(labelText: '储存说明'),
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
                  final controller = ref.read(homeStateProvider.notifier);
                  if (medicine == null) {
                    await controller.addMedicine(
                      MedicineEntry(
                        memberId: memberId,
                        name: name.text.trim(),
                        specification: specification.text.trim(),
                        dosageForm: dosageForm.text.trim(),
                        quantity: double.parse(quantity.text),
                        unit: unit.text.trim(),
                        expiryDate: expiryDate,
                        lowStockThreshold: double.parse(lowStockThreshold.text),
                        indication: indication.text,
                        storageNotes: storageNotes.text,
                      ),
                    );
                  } else {
                    await controller.updateMedicine(
                      medicine.id,
                      MedicineUpdate(
                        name: name.text.trim(),
                        specification: specification.text.trim(),
                        dosageForm: dosageForm.text.trim(),
                        indication: indication.text,
                        storageNotes: storageNotes.text,
                      ),
                    );
                  }
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

Future<void> _showMedicineDetail(
  BuildContext context,
  WidgetRef ref,
  String medicineId,
) async {
  await showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(homeStateProvider);
          final medicine = state.medicines
              .where((item) => item.id == medicineId)
              .firstOrNull;
          if (medicine == null) {
            return const SizedBox.shrink();
          }
          final batches = state.batches
              .where((batch) => batch.medicineItemId == medicine.id)
              .toList();
          final engine = ref.watch(reminderEngineProvider);
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(medicine.name,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('${medicine.specification} · ${medicine.dosageForm}'),
              if (medicine.indication != null)
                Text('用途：${medicine.indication}'),
              if (medicine.storageNotes != null)
                Text('储存：${medicine.storageNotes}'),
              const Divider(height: 32),
              Text('批次', style: Theme.of(context).textTheme.titleMedium),
              for (final batch in batches)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('${batch.quantity}${batch.unit}'),
                  subtitle: Text(
                    '有效期 ${DateFormat('yyyy-MM-dd').format(batch.expiryDate)} · ${_statusLabel(engine.statusFor(batch, DateTime.now()))}',
                  ),
                  trailing: IconButton(
                    tooltip: '减少库存',
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: batch.quantity <= 0
                        ? null
                        : () => ref
                            .read(homeStateProvider.notifier)
                            .reduceBatchQuantity(batch.id, 1),
                  ),
                ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _showMedicineForm(context, ref, state,
                          medicine: medicine),
                      icon: const Icon(Icons.edit_outlined),
                      label: const Text('编辑'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.tonalIcon(
                      onPressed: () =>
                          _confirmDeleteMedicine(context, ref, medicine),
                      icon: const Icon(Icons.delete_outline),
                      label: const Text('删除'),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}

Future<void> _confirmDeleteMedicine(
  BuildContext context,
  WidgetRef ref,
  MedicineItem medicine,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('删除药品'),
      content: Text('确认删除“${medicine.name}”？相关批次也会同步删除。'),
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
    await ref.read(homeStateProvider.notifier).deleteMedicine(medicine.id);
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}

TextFormField _requiredField(TextEditingController controller, String label) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: label),
    validator: (value) =>
        value == null || value.trim().isEmpty ? '请填写$label' : null,
  );
}

TextFormField _numberField(TextEditingController controller, String label) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: label),
    keyboardType: TextInputType.number,
    validator: (value) {
      final parsed = double.tryParse(value ?? '');
      if (parsed == null || parsed < 0) {
        return '请填写有效数字';
      }
      return null;
    },
  );
}

String _statusLabel(MedicineStatus status) {
  return switch (status) {
    MedicineStatus.expired => '已过期',
    MedicineStatus.lowStock => '库存不足',
    MedicineStatus.expiringSoon => '即将过期',
    MedicineStatus.usedUp => '已用完',
    MedicineStatus.normal => '正常',
  };
}
