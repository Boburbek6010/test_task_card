import 'package:get/get.dart';
import 'package:test_task_card/feature/card_scanner/card_scanner_logic.dart';
import 'package:test_task_card/feature/card_scanner/card_scanner_logic_impl.dart';

class CardScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardScannerLogic>(() => CardScannerLogicImpl());
  }
}
