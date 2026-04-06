import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../data/local/drift/home_medicine_drift_blueprint.dart';
import '../../../shared/widgets/section_card.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final securityGate = ref.watch(securityGateProvider);

    return FutureBuilder<bool>(
      future: securityGate.isProtectionEnabled(),
      builder: (context, snapshot) {
        final protectionEnabled = snapshot.data ?? true;

        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            SectionCard(
              title: '安全与解锁',
              child: Column(
                children: [
                  SwitchListTile.adaptive(
                    value: protectionEnabled,
                    onChanged: null,
                    title: const Text('启用应用保护'),
                    subtitle: const Text('后续接入 local_auth 与系统生物识别/设备密码'),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('通知提醒'),
                    subtitle: const Text('过期提醒、库存不足提醒都在本地计算与派发'),
                    trailing: const Icon(Icons.chevron_right_rounded),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SectionCard(
              title: '技术架构',
              subtitle: '当前脚手架已经按本地优先架构拆出了核心边界',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Flutter + Riverpod + Drift 蓝图 + 可插拔识别层'),
                  const SizedBox(height: 12),
                  Text(
                    'Schema v${HomeMedicineDriftBlueprint.currentSchemaVersion}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 8),
                  for (final note in HomeMedicineDriftBlueprint.notes)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(note),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const SectionCard(
              title: '隐私说明',
              child: Text(
                '当前架构按单设备、本地存储、无账号、无自建服务器设计。AI 识别结果必须先进入草稿，再由用户确认入库。',
              ),
            ),
          ],
        );
      },
    );
  }
}

