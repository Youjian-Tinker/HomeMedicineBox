import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.title,
    required this.currentIndex,
    required this.child,
    this.floatingActionButton,
    super.key,
  });

  final String title;
  final int currentIndex;
  final Widget child;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(child: child),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/');
            case 1:
              context.go('/medicines');
            case 2:
              context.go('/visits');
            case 3:
              context.go('/drafts');
            case 4:
              context.go('/settings');
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: '首页'),
          NavigationDestination(
              icon: Icon(Icons.medication_outlined), label: '药品'),
          NavigationDestination(icon: Icon(Icons.folder_outlined), label: '就诊'),
          NavigationDestination(
              icon: Icon(Icons.edit_note_outlined), label: '草稿'),
          NavigationDestination(
              icon: Icon(Icons.settings_outlined), label: '设置'),
        ],
      ),
    );
  }
}
