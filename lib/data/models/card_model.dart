import '../entities/card_entity.dart';

class CardModel extends CardEntity {
  CardModel({
    required super.panNumber,
    required super.expiryDate,
    required super.cardType,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      panNumber: json['panNumber'],
      expiryDate: json['expiryDate'],
      cardType: _parseCardType(json['cardType']),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'panNumber': panNumber,
      'expiryDate': expiryDate,
      'cardType': cardType.toString(),
    };
  }

  static CardType _parseCardType(String type) {
    return type.toLowerCase().contains('humo')
        ? CardType.humo
        : CardType.uzcard;
  }

  CardEntity toEntity() {
    return CardEntity(
      panNumber: panNumber,
      expiryDate: expiryDate,
      cardType: cardType,
    );
  }

  @override
  String toString() {
    return "Num: $panNumber \nDate: $expiryDate, \nType: $cardType";
  }
}