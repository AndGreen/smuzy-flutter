import 'package:intl/intl.dart';

String getCurrentFormattedDay() =>
    DateFormat('MM.dd.yy - E').format(DateTime.now()).toLowerCase();
