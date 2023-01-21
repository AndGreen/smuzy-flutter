import 'package:intl/intl.dart';

String getCurrentFormattedDay([DateTime? date]) {
  var formattedDate = '';
  if (date == null) {
    formattedDate = 'Today - ${DateFormat('E').format(DateTime.now())}';
  } else {
    formattedDate = DateFormat('MM.dd.yy - E').format(date);
  }
  return formattedDate.toLowerCase();
}
