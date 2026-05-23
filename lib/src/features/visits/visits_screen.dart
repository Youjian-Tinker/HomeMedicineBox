import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../app/app_state.dart';
import '../shared/app_scaffold.dart';

class VisitsScreen extends ConsumerWidget {
  const VisitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);
    final format = DateFormat('yyyy-MM-dd');

    return AppScaffold(
      title: '就诊档案',
      currentIndex: 2,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: state.visits.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final visit = state.visits[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.local_hospital_outlined),
              title: Text(visit.diagnosisSummary),
              subtitle: Text(
                '${format.format(visit.visitDate)} · ${visit.hospitalName ?? '未填写医院'}',
              ),
            ),
          );
        },
      ),
    );
  }
}
