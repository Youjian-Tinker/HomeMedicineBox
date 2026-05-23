import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_medicine_box/src/app/home_medicine_box_app.dart';

void main() {
  testWidgets('app starts on the home screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: HomeMedicineBoxApp()));
    await tester.pumpAndSettle();

    expect(find.text('HomeMedicineBox'), findsOneWidget);
    expect(find.text('今日提醒'), findsOneWidget);
    expect(find.text('拍照录药'), findsOneWidget);
  });
}
