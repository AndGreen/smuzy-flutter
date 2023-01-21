import 'package:smuzy_flutter/modules/days/days_provider.dart';

class HistoryService {
  Map<BlockId, RoutineId> history = {};

  Map<BlockId, RoutineId> getDaySlice(DateTime date, List<BlockId> blockRange) {
    Map<BlockId, RoutineId> result = {};
    for (var blockId in blockRange) {
      if (history.containsKey(blockId)) {
        result[blockId] = history[blockId]!;
      }
    }
    return result;
  }

  void saveDaySlice(DateTime date, Map<BlockId, RoutineId> visibleDay) {
    history.addAll(visibleDay);
  }
}
