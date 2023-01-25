import 'package:hive_flutter/adapters.dart';
import 'package:smuzy/modules/days/day_repository.dart';
import 'package:smuzy/modules/routines/models/routine_model.dart';
import 'package:smuzy/modules/routines/routine_repository.dart';

class LocalDatabase {
  static init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ColorAdapter());
    Hive.registerAdapter(RoutineAdapter());
    await RoutinesRepository.init();
    await DaysRepository.init();
  }
}
