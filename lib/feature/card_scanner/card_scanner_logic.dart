import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_task_card/data/models/card_model.dart';

import 'card_scanner_state.dart';

abstract mixin class CardScannerLogic {
  abstract final CardScannerState state;
  abstract final TextEditingController numberController;
  abstract final TextEditingController expireDateController;
  Future<void> addNewCard();

  void onNumberChanged();
  void onDateChanged();


}
