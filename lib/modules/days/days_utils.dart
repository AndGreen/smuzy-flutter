import 'package:flutter/material.dart';
import 'package:smuzy_flutter/common/models/routine.dart';
import 'package:smuzy_flutter/modules/days/days_provider.dart';
import 'package:collection/collection.dart';

BlockId getBlockId(DateTime day, int offset) {
  DateTime today = DateTime(day.year, day.month, day.day);
  int timestamp = today.toUtc().millisecondsSinceEpoch;
  int blocks = (timestamp / 1000 / 1200).floor();
  int id = blocks + offset;
  return id;
}

List<BlockId> getDayBlockRange(DateTime day) {
  final firstDayBlockID = getBlockId(day, 0);
  return List.generate(24, (index) => firstDayBlockID + index);
}

Color? getRoutineColor(List<Routine> routines, RoutineId? routineId) {
  return routines
      .firstWhereOrNull(
        (element) => element.id == routineId,
      )
      ?.color;
}
