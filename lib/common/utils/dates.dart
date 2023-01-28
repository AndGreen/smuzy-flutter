import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  DateTime get startOfDay => DateTime(year, month, day);

  bool isSameDay(DateTime? b) {
    if (b == null) {
      return false;
    }

    return year == b.year && month == b.month && day == b.day;
  }

  String getFormatted() {
    var formattedDate = '';
    var diffNow = startOfDay.difference(DateTime.now().startOfDay).inDays;
    var dayOfWeek = DateFormat('E').format(DateTime.now());

    switch (diffNow) {
      case 0:
        formattedDate = 'Today - $dayOfWeek';
        break;
      case 1:
        formattedDate = 'Tomorrow - $dayOfWeek';
        break;
      case -1:
        formattedDate = 'Yesterday - $dayOfWeek';
        break;
      default:
        formattedDate = DateFormat('MM.dd.yy - ').format(this) + dayOfWeek;
    }

    return formattedDate.toLowerCase();
  }
}
