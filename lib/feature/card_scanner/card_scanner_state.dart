import 'package:get/get.dart';
import 'package:test_task_card/data/models/card_model.dart';

class CardScannerState {
  RxList<CardModel> cardList = RxList([]);
  RxString cardNumber = RxString("");
  RxString cardDate = RxString("");
  RxBool isLoading = RxBool(false);
}
