import 'package:flutter/material.dart';

import '../shared/app_scaffold.dart';
import '../shared/section_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '设置',
      currentIndex: 3,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SectionCard(
            title: '安全与解锁',
            child: Text('首版将接入生物识别或设备密码，用于保护本地健康资料。'),
          ),
          SizedBox(height: 16),
          SectionCard(
            title: 'AI 识别说明',
            child: Text('只有用户主动选择的照片会发送给可配置 AI 服务。识别结果必须确认后才会入库。'),
          ),
          SizedBox(height: 16),
          SectionCard(
            title: '隐私说明',
            child: Text('当前版本不提供账号和同步服务，正式数据和图片保存在本机。'),
          ),
        ],
      ),
    );
  }
}
