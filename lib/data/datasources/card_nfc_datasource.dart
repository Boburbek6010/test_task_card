import 'dart:developer';

import 'package:nfc_manager/nfc_manager.dart';

import '../../../../core/error/exceptions.dart';
import '../entities/card_entity.dart';
import '../models/card_model.dart';

abstract class CardNfcDataSource {
  Future<CardModel> readCard();
}

class CardNfcDataSourceImpl implements CardNfcDataSource {
  @override
  Future<CardModel> readCard() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      if (!isAvailable) {
        log("llllll");
        throw NfcException();
      }

      CardModel? cardModel;

      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          var ndefMessage = tag.data['ndef']['cachedMessage'];
          // Parse NFC data and create card model
          // This is a simplified implementation
          log("NFC: $ndefMessage");
          cardModel = await _parseNfcData(ndefMessage);
        },
      );

      if (cardModel == null) {
        throw NfcException();
      }

      return cardModel!;
    } catch (e) {
      throw NfcException();
    }
  }

  Future<CardModel> _parseNfcData(dynamic nfcData) async {
    // Implement NFC data parsing logic
    // For now, returning mock data
    return CardModel(
      panNumber: '9860123456789012',
      expiryDate: '12/25',
      cardType: CardType.humo,
    );
  }
}