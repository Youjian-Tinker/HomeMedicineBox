import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_medicine_box/src/app/app_state.dart';
import 'package:home_medicine_box/src/app/home_medicine_box_app.dart';
import 'package:home_medicine_box/src/data/local/app_database.dart';

void main() {
  testWidgets('app starts on the home screen', (tester) async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(database)],
        child: const HomeMedicineBoxApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('HomeMedicineBox'), findsOneWidget);
    expect(find.text('今日提醒'), findsOneWidget);
    expect(find.text('新增药品'), findsOneWidget);
  });
}
