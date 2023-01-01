import 'package:intl/intl.dart';

class CurrencyFormat {
  static String convertToIdr(dynamic price, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(price);
  }
}
