import 'package:hive_flutter/hive_flutter.dart';
import 'package:smuzy_flutter/modules/routines/models/routine_model.dart';

typedef RoutinesDatabase = Box<Routine>;
const routinesBoxTitle = 'routines';

class RoutinesRepository {
  static init() async {
    await Hive.openBox<Routine>(routinesBoxTitle);
  }

  static Map<RoutineId, Routine> getRoutines() {
    Map<RoutineId, Routine> result = {};
    Hive.box<Routine>(routinesBoxTitle).values.forEach((routine) {
      result[routine.id] = routine;
    });
    return result;
  }

  static void saveRoutines(Map<RoutineId, Routine> routines) {
    Hive.box<Routine>(routinesBoxTitle).clear();
    routines.forEach((routineId, routine) {
      Hive.box<Routine>(routinesBoxTitle).put(
        routineId,
        Routine(
          id: routineId,
          color: routine.color,
          title: routine.title,
        ),
      );
    });
  }
}
