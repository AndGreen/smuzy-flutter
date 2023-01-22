import 'package:flutter/material.dart';
import 'package:smuzy_flutter/common/models/routine.dart';
import 'package:collection/collection.dart';
import 'package:smuzy_flutter/common/utils/dates.dart';
import 'package:smuzy_flutter/modules/days/day_constants.dart';

BlockId getBlockId(DateTime day, int offset) {
  int timestamp = day.startOfDay.toUtc().millisecondsSinceEpoch;
  int blocks = (timestamp / 1000 / 1200).floor();
  int id = blocks + offset;
  return id;
}

List<BlockId> getDayBlockRange(DateTime day) {
  final firstDayBlockID = getBlockId(day, 0);
  return List.generate(rowCount * colCount, (index) => firstDayBlockID + index);
}

Color? getRoutineColor(List<Routine> routines, RoutineId? routineId) {
  return routines
      .firstWhereOrNull(
        (element) => element.id == routineId,
      )
      ?.color;
}
