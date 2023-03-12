import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String formattedDateTime() {
    return DateFormat.yMMMMd('en_US').format(this);
  }
}
