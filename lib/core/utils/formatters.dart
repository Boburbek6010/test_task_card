import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    String numbers = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';

    for (int i = 0; i < numbers.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted += ' ';
      }
      formatted += numbers[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    String numbers = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';

    if (numbers.length >= 2) {
      formatted = numbers.substring(0, 2) + '/';
      if (numbers.length > 2) {
        formatted += numbers.substring(2);
      }
    } else {
      formatted = numbers;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

