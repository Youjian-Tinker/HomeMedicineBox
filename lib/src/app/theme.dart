import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  const seed = Color(0xFF2C6E63);
  final scheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: seed,
    primary: const Color(0xFF245D54),
    secondary: const Color(0xFFD98B3A),
    surface: const Color(0xFFFFFBF4),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: const Color(0xFFF6F1E7),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: scheme.onSurface,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: EdgeInsets.zero,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFFCF7EF),
      indicatorColor: const Color(0xFFDDEEE9),
      labelTextStyle: MaterialStateProperty.resolveWith(
        (states) => TextStyle(
          fontSize: 12,
          fontWeight: states.contains(MaterialState.selected)
              ? FontWeight.w700
              : FontWeight.w500,
        ),
      ),
    ),
    chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      side: BorderSide.none,
    ),
  );
}
