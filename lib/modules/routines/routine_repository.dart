import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smuzy_flutter/common/models/routine.dart';

typedef RoutinesDatabase = Box<RoutineHive>;
const routinesBoxTitle = 'routines';

class RoutinesRepository {
  static init() async {
    await Hive.openBox<RoutineHive>(routinesBoxTitle);
  }

  static Map<RoutineId, Routine> restoreRoutines() {
    Map<RoutineId, Routine> result = {};
    Hive.box<RoutineHive>(routinesBoxTitle).values.forEach((routine) {
      result[routine.id] = Routine(
          id: routine.id,
          color: Color(routine.colorValue),
          title: routine.title);
    });
    return result;
  }

  static void saveRoutines(Map<RoutineId, Routine> routines) {
    routines.forEach((routineId, routine) {
      Hive.box<RoutineHive>(routinesBoxTitle).put(
          routineId,
          RoutineHive(
              id: routineId,
              colorValue: routine.color.value,
              title: routine.title));
    });
  }
}
