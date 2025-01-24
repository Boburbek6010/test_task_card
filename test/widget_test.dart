import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_card/app.dart';
import 'package:test_task_card/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  testWidgets(
    'Initial',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MyApp(),
      );
    },
  );
}
