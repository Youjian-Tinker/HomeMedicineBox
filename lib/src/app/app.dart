import 'package:flutter/material.dart';

import 'home_shell.dart';
import 'theme.dart';

class HomeMedicineBoxApp extends StatelessWidget {
  const HomeMedicineBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeMedicineBox',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const HomeShell(),
    );
  }
}

