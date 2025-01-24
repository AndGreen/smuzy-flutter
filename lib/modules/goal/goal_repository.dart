import 'package:hive_flutter/hive_flutter.dart';
import 'package:smuzy/modules/routines/models/routine_model.dart';

typedef HistoryDatabase = Box<String>;
const goalBox = 'goalRepository';

class GoalRepository {
  static init() async {
    await Hive.openBox<RoutineId>(goalBox);
  }

  static getGoal(DateTime date) async {}

  static void saveGoal(DateTime date) async {}
}
