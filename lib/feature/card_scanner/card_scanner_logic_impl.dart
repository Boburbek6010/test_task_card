import 'dart:convert';

import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:test_task_card/data/models/card_model.dart';
import 'package:test_task_card/feature/card_scanner/card_scanner_state.dart';

import '../../core/manager/storage_manager.dart';
import '../../data/entities/card_entity.dart';
import '../../injection_container.dart';
import 'card_scanner_logic.dart';

class CardScannerLogicImpl extends GetxController implements CardScannerLogic {
  @override
  CardScannerState state = CardScannerState();
  final StorageManager _storageManager = sl<StorageManager>();

  @override
  void onInit() async {
    // _storageManager.clear();
    // CardModel cardModel = CardModel.fromJson(jsonDecode(_storageManager.read(key: StorageKey.card) ?? "{}"));

    // state.cardList.add(cardModel);
    super.onInit();
  }

  @override
  Future<void> addNewCard() async {
    state.isLoading.value = true;
    final CardModel cardModel = CardModel(panNumber: numberController.text.trim(), expiryDate: expireDateController.text.trim(), cardType: numberController.text.trim().startsWith("9860") ? CardType.humo : CardType.uzcard);
    state.cardList.add(cardModel);
    await _storageManager.write(key: StorageKey.card, data: cardModel.toJson());
    expireDateController.clear();
    numberController.clear();
    state.isLoading.value = false;
  }

  @override
  TextEditingController expireDateController = TextEditingController();

  @override
  TextEditingController numberController = TextEditingController();

  @override
  void onNumberChanged() {
    // state.cardNumber.value = numberController.text.trim();
  }

  @override
  void onDateChanged() {
    // state.cardDate.value = expireDateController.text.trim();
  }
}
