import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utils/color_from_hex.dart';
import '../domain/models/family_member.dart';
import '../features/drafts/presentation/drafts_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/medicines/presentation/medicine_list_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/visits/presentation/visit_timeline_screen.dart';
import 'providers.dart';

class HomeShell extends ConsumerStatefulWidget {
  const HomeShell({super.key});

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  int _currentIndex = 0;

  static const _titles = ['首页', '药品', '就诊档案', '设置'];

  @override
  Widget build(BuildContext context) {
    final familyMembers = ref.watch(familyMembersProvider);
    final selectedMemberId = ref.watch(selectedMemberIdProvider);

    final pages = const [
      HomeScreen(),
      MedicineListScreen(),
      VisitTimelineScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        actions: [
          familyMembers.when(
            data: (members) => _MemberSwitcherButton(
              members: members,
              selectedMemberId: selectedMemberId,
            ),
            error: (_, __) => const SizedBox.shrink(),
            loading: () => const Padding(
              padding: EdgeInsets.only(right: 12),
              child: SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
          IconButton(
            tooltip: '草稿箱',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const DraftsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.inventory_2_outlined),
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: '首页'),
          NavigationDestination(icon: Icon(Icons.medication_outlined), label: '药品'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), label: '档案'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: '设置'),
        ],
      ),
    );
  }
}

class _MemberSwitcherButton extends ConsumerWidget {
  const _MemberSwitcherButton({
    required this.members,
    required this.selectedMemberId,
  });

  final List<FamilyMember> members;
  final String? selectedMemberId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FamilyMember? selected;
    for (final member in members) {
      if (member.id == selectedMemberId) {
        selected = member;
        break;
      }
    }

    return PopupMenuButton<String>(
      tooltip: '切换成员',
      onSelected: (memberId) {
        ref.read(selectedMemberIdProvider.notifier).state = memberId;
      },
      itemBuilder: (context) {
        return [
          for (final member in members)
            PopupMenuItem<String>(
              value: member.id,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: colorFromHex(member.avatarColorHex),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(member.name)),
                  if (member.id == selectedMemberId)
                    const Icon(Icons.check_rounded, size: 18),
                ],
              ),
            ),
        ];
      },
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.82),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: colorFromHex(
                selected?.avatarColorHex ?? members.first.avatarColorHex,
              ),
            ),
            const SizedBox(width: 8),
            Text(selected?.name ?? '切换成员'),
            const SizedBox(width: 4),
            const Icon(Icons.expand_more_rounded, size: 18),
          ],
        ),
      ),
    );
  }
}
