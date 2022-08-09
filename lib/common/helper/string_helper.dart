import 'package:intl/intl.dart';

String formatNumber(int number) {
  return NumberFormat("###,###").format(number);
}

extension NumberFormater on int {
  String get formatNumber => NumberFormat("###,###").format(this);
}

extension DateTimeFormater on DateTime {
  String get formatDate => DateFormat("dd MMMM yyyy").format(this);
}
