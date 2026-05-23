import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_state.dart';
import '../shared/app_scaffold.dart';

class MedicinesScreen extends ConsumerWidget {
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);
    final controller = ref.read(homeStateProvider.notifier);

    return AppScaffold(
      title: '药品',
      currentIndex: 1,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: state.medicines.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final medicine = state.medicines[index];
          final batches = state.batches
              .where((batch) => batch.medicineItemId == medicine.id)
              .toList();
          return Card(
            child: ListTile(
              title: Text(medicine.name),
              subtitle: Text(
                '${medicine.specification} · ${batches.length} 个批次',
              ),
              trailing: IconButton(
                tooltip: '删除',
                icon: const Icon(Icons.delete_outline),
                onPressed: () => controller.deleteMedicine(medicine.id),
              ),
            ),
          );
        },
      ),
    );
  }
}
