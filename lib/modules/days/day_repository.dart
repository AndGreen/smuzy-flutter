import 'package:hive_flutter/hive_flutter.dart';
import 'package:smuzy/modules/routines/models/routine_model.dart';

typedef HistoryDatabase = Box<String>;
const daysBox = 'daysHistory';

class DaysRepository {
  static init() async {
    await Hive.openBox<RoutineId>(daysBox);
  }

  static Map<BlockId, RoutineId?> getDaySlice(List<BlockId> blockRange) {
    Map<BlockId, RoutineId?> result = {};

    for (var blockId in blockRange) {
      if (Hive.box<String>(daysBox).containsKey(blockId)) {
        result[blockId] = Hive.box<String>(daysBox).get(blockId);
      }
    }
    return result;
  }

  static Map<BlockId, RoutineId?> getFullHistory() {
    Map<BlockId, RoutineId?> result =
        Hive.box<RoutineId>(daysBox).toMap().cast<BlockId, RoutineId?>();

    return result;
  }

  static restoreFullHistory(Map<BlockId, RoutineId?> history) async {
    await Hive.box<RoutineId>(daysBox).clear();
    history.forEach((blockId, routineId) {
      saveBlock(blockId, routineId);
    });
  }

  static void saveBlock(BlockId blockId, RoutineId? routineId) {
    if (routineId == null) {
      Hive.box<RoutineId>(daysBox).delete(blockId);
    } else {
      Hive.box<RoutineId>(daysBox).put(blockId, routineId);
    }
  }
}
