import 'package:flutter/material.dart';

Color colorFromHex(String hex) {
  final normalized = hex.replaceAll('#', '');
  final value = int.parse('FF$normalized', radix: 16);
  return Color(value);
}

