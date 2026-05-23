import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app/home_medicine_box_app.dart';

void main() {
  runApp(const ProviderScope(child: HomeMedicineBoxApp()));
}
