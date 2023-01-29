import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smuzy/modules/routines/models/routine_model.dart';
import 'package:collection/collection.dart';
import 'package:smuzy/common/utils/dates.dart';
import 'package:smuzy/modules/days/day_constants.dart';

BlockId getBlockId(DateTime day, [int? offset]) {
  int timestamp = day.toUtc().millisecondsSinceEpoch;
  int blocks = (timestamp / 1000 / 1200).floor();
  int id = blocks + (offset ?? 0);
  return id;
}

// TODO Dart3: rewrite using records start and end instead generate array of blocks
List<BlockId> getDayBlockRange(DateTime day) {
  final firstDayBlockID = getBlockId(day.startOfDay);
  return List.generate(rowCount * colCount, (index) => firstDayBlockID + index);
}

Color? getRoutineColor(List<Routine> routines, RoutineId? routineId) {
  return routines
      .firstWhereOrNull(
        (element) => element.id == routineId,
      )
      ?.color;
}

String getFormattedDayLabel(DateTime day) {
  var formattedDate = '';
  var diffNow = day.startOfDay.difference(DateTime.now().startOfDay).inDays;
  var dayOfWeek = DateFormat('E').format(day);

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
      formattedDate = DateFormat('MM.dd.yy - ').format(day) + dayOfWeek;
  }

  return formattedDate.toLowerCase();
}
