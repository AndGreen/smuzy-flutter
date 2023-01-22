import 'package:intl/intl.dart';

String getCurrentFormattedDay(DateTime date) {
  var formattedDate = '';
  var diffNow = date.startOfDay.difference(DateTime.now().startOfDay).inDays;
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
      formattedDate = DateFormat('MM.dd.yy - ').format(date) + dayOfWeek;
  }

  return formattedDate.toLowerCase();
}

extension DateTimeExtensions on DateTime {
  DateTime get startOfDay => DateTime(year, month, day);
}
