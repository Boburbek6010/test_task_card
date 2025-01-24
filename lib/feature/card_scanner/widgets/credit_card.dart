import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/entities/card_entity.dart';


class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final CardType? cardType;

  const CreditCardWidget({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    this.cardType,
  });




  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width*0.8,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withValues(
            alpha: 0.5,
          ),
          width: 1
        ),
        gradient: LinearGradient(
          colors: _generateRandomGradient(),
          // colors: cardType == CardType.humo ? [Color(0xFF1E3C72), Color(0xFF2A5298)] : [Color(0xFF2193b0), Color(0xFF6dd5ed)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.blueGrey.withValues(
        //       alpha: 0.5,
        //     ),
        //     spreadRadius: 1,
        //     blurRadius: 10,
        //     offset: Offset(5, 5),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              cardType != null
                  ? Image.asset(
                      cardType == CardType.humo ? 'assets/images/humo_logo.png' : 'assets/images/uzcard_logo.png',
                      height: 50,
                      // If you don't have logos yet, use a Text widget instead
                      errorBuilder: (context, error, stackTrace) => Text(
                        cardType == CardType.humo ? 'HUMO' : 'UZCARD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              cardType != null ? Icon(Icons.contactless_outlined, color: Colors.white, size: 30) : SizedBox.shrink(),
            ],
          ),
          Text(
            _formatCardNumber(cardNumber),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
              fontFamily: 'Courier',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expiry day',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    expiryDate,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Icon(
               CupertinoIcons.money_dollar_circle,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatCardNumber(String number) {
    if (number.isEmpty) return '';

    final cleaned = number.replaceAll(RegExp(r'\D'), '');
    final chunks = [];

    for (var i = 0; i < cleaned.length; i += 4) {
      if (i + 4 <= cleaned.length) {
        chunks.add(cleaned.substring(i, i + 4));
      } else {
        chunks.add(cleaned.substring(i));
      }
    }

    return chunks.join(' ');
  }

  List<Color> _generateRandomGradient() {
    Random random = Random();
    Color color1 = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    Color color2 = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    return [color1, color2];
  }
}

