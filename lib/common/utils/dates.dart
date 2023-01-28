extension DateTimeExtensions on DateTime {
  DateTime get startOfDay => DateTime(year, month, day);

  bool isSameDay(DateTime? b) {
    if (b == null) {
      return false;
    }

    return year == b.year && month == b.month && day == b.day;
  }
}
