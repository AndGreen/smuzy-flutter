import 'package:hive_flutter/hive_flutter.dart';
import 'package:smuzy/modules/routines/models/routine_model.dart';

typedef RoutinesDatabase = Box<Routine>;
const routinesBox = 'routines';

class RoutinesRepository {
  static init() async {
    await Hive.openBox<Routine>(routinesBox);
  }

  static List<Routine> getRoutines() {
    List<Routine> result = [];
    Hive.box<Routine>(routinesBox).toMap().forEach((key, value) {
      result.add(value);
    });
    return result;
  }

  static void updateRoutines(List<Routine> routines) async {
    await Hive.box<Routine>(routinesBox).clear();
    for (var routine in routines) {
      Hive.box<Routine>(routinesBox).put(routine.id, routine);
    }
  }

  static Future<int> clear() {
    return Hive.box<Routine>(routinesBox).clear();
  }
}
