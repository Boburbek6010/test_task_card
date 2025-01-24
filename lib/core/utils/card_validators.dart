class CardValidators {
  static bool isValidPan(String pan) {
    pan = pan.replaceAll(RegExp(r'\D'), '');

    if (pan.length != 16) return false;

    int sum = 0;
    bool alternate = false;

    for (int i = pan.length - 1; i >= 0; i--) {
      int n = int.parse(pan[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) {
          n = (n % 10) + 1;
        }
      }
      sum += n;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }

  static bool isValidExpiryDate(String expiry) {
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(expiry)) return false;

    final parts = expiry.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);

    if (month == null || year == null) return false;
    if (month < 1 || month > 12) return false;

    final now = DateTime.now();
    final cardDate = DateTime(2000 + year, month);

    return cardDate.isAfter(now);
  }
}
