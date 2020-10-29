import 'package:intl/intl.dart';

class Time {
  String generateTime() {
    DateFormat dateFormat = DateFormat("HH:mm");

    return dateFormat.format(DateTime.now());
  }
}
