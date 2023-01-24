import 'package:hive_flutter/hive_flutter.dart';
import 'package:smuzy_flutter/modules/days/day_repository.dart';
import 'package:smuzy_flutter/modules/routines/models/routine_model.dart';
import 'package:smuzy_flutter/modules/routines/routine_repository.dart';

class LocalDatabase {
  static init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RoutineAdapter());
    await RoutinesRepository.init();
    await DaysRepository.init();
  }
}
