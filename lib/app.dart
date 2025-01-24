import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_card/core/routes/routes.dart';
import 'package:test_task_card/feature/card_scanner/card_scanner_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credit Card',
      getPages: routes,
      initialRoute: CardScannerPage.route,
    );
  }
}
