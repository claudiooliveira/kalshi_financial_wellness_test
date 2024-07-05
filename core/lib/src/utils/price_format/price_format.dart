import 'package:intl/intl.dart';

String priceFormat(num number) {
  // NumberFormat formatador = NumberFormat("#,##0.00", "pt_BR");
  // return formatador.format(number);
  // return NumberFormat("#,##0.00", "pt_BR").format(number);
  final priceFormatted =
      NumberFormat.currency(locale: 'es_ES', symbol: '').format(number);
  int lastCommaIndex = priceFormatted.lastIndexOf(',');
  String integerPart = priceFormatted.substring(0, lastCommaIndex);
  String decimalPart = priceFormatted.substring(lastCommaIndex + 1);

  integerPart = integerPart.replaceAll('.', ',');
  decimalPart = decimalPart.replaceAll(',', '.');

  return '$integerPart.$decimalPart';
  //.replaceAll(RegExp(r'\s+'), '');
}

String pointsFormat(num number) {
  return NumberFormat("#,##0.00", "pt_BR").format(number / 100);
}
