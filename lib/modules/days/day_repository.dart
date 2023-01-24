import 'package:hive_flutter/hive_flutter.dart';
import 'package:smuzy_flutter/common/models/routine.dart';

typedef HistoryDatabase = Box<String>;
const daysBoxTitle = 'daysHistory';

class DaysRepository {
  static init() async {
    await Hive.openBox<RoutineId>(daysBoxTitle);
  }

  static Map<BlockId, RoutineId?> getDaySlice(List<BlockId> blockRange) {
    Map<BlockId, RoutineId?> result = {};

    for (var blockId in blockRange) {
      if (Hive.box<String>(daysBoxTitle).containsKey(blockId)) {
        result[blockId] = Hive.box<String>(daysBoxTitle).get(blockId);
      }
    }
    return result;
  }

  static Map<BlockId, RoutineId?> getAllHistory() {
    Map<BlockId, RoutineId?> result = {};

    print(Hive.box<String>(daysBoxTitle).values.toList());

    return result;
  }

  static void saveBlock(BlockId blockId, RoutineId? routineId) {
    if (routineId == null) {
      Hive.box<RoutineId>(daysBoxTitle).delete(blockId);
    } else {
      Hive.box<RoutineId>(daysBoxTitle).put(blockId, routineId);
    }
  }
}
