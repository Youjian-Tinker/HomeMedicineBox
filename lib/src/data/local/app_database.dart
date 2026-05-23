import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'drift_schema.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  FamilyMembers,
  MedicineItems,
  MedicineBatches,
  VisitRecords,
  MedicalDocumentRecords,
  RecognitionDrafts,
  LocalImageAssets,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'home_medicine_box.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

String encodeStringList(List<String> value) => jsonEncode(value);

List<String> decodeStringList(String value) {
  final decoded = jsonDecode(value);
  if (decoded is List) {
    return decoded.map((item) => item.toString()).toList();
  }
  return const [];
}

String encodeMap(Map<String, Object?> value) => jsonEncode(value);

Map<String, Object?> decodeMap(String value) {
  final decoded = jsonDecode(value);
  if (decoded is Map<String, dynamic>) {
    return decoded;
  }
  if (decoded is Map) {
    return decoded.map((key, val) => MapEntry(key.toString(), val));
  }
  return const {};
}
