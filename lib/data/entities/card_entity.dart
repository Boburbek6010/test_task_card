class CardEntity {
  final String panNumber;
  final String expiryDate;
  final CardType cardType;

  CardEntity({
    required this.panNumber,
    required this.expiryDate,
    required this.cardType,
  });
}

enum CardType { humo, uzcard }