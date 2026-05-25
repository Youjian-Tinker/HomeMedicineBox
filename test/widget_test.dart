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
    expect(find.text('草稿'), findsNothing);
  });

  testWidgets('manual visit form omits recognition-only fields',
      (tester) async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(database)],
        child: const HomeMedicineBoxApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('就诊').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('新增就诊'));
    await tester.pumpAndSettle();

    expect(find.text('诊断/问题摘要'), findsOneWidget);
    expect(find.text('备注/文档摘要'), findsOneWidget);
    expect(find.text('医院名称'), findsNothing);
    expect(find.text('科室'), findsNothing);
    expect(find.text('医生姓名'), findsNothing);
  });
}
