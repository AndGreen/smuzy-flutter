import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smuzy_flutter/common/models/routine.dart';
import 'package:smuzy_flutter/modules/days/day_utils.dart';
import 'package:smuzy_flutter/modules/days/day_repository.dart';

part 'day_provider.freezed.dart';
part 'day_provider.g.dart';

@freezed
class DayState with _$DayState {
  factory DayState({
    required Map<BlockId, RoutineId?> visibleDayGrid,
    required DateTime visibleDate,
  }) = _DayState;
}

@riverpod
class Day extends _$Day {
  @override
  DayState build() {
    final today = DateTime.now();
    return DayState(visibleDayGrid: _getDayGrid(today), visibleDate: today);
  }

  _getDayGrid(DateTime day) {
    return DaysRepository.getDaySlice(getDayBlockRange(day));
  }

  colorizeDayBlock(BlockId blockId, RoutineId? routineId) {
    state = state.copyWith(
        visibleDayGrid: {...state.visibleDayGrid, blockId: routineId});
    DaysRepository.saveBlock(blockId, routineId);
  }

  changeVisibleDate(DateTime newDate) {
    state = state.copyWith(
        visibleDate: newDate, visibleDayGrid: _getDayGrid(newDate));
  }
}
