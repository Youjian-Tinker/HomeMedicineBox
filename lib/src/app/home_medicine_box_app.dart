import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/home_screen.dart';
import '../features/medicines/medicines_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/visits/visits_screen.dart';
import 'theme.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
    GoRoute(path: '/medicines', builder: (_, __) => const MedicinesScreen()),
    GoRoute(path: '/visits', builder: (_, __) => const VisitsScreen()),
    GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
  ],
);

class HomeMedicineBoxApp extends StatelessWidget {
  const HomeMedicineBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'HomeMedicineBox',
      theme: buildAppTheme(),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
