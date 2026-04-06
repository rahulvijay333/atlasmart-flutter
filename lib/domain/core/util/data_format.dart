import 'package:intl/intl.dart';

class CustomDateFormat {
  static String ddmmmyyyWithTime(String date) {
    return DateFormat('dd MMM yyy, hh:mm aa ').format(DateTime.parse(date));
  }
}
