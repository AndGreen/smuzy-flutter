import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smuzy_flutter/common/models/routine.dart';
import 'package:smuzy_flutter/modules/days/day_utils.dart';
import 'package:smuzy_flutter/modules/days/day_repository.dart';

part 'days_provider.freezed.dart';
part 'days_provider.g.dart';

@freezed
class DaysState with _$DaysState {
  factory DaysState({
    required Map<BlockId, RoutineId?> visibleDayGrid,
    required DateTime visibleDate,
  }) = _DaysState;
}

@riverpod
class Days extends _$Days {
  @override
  DaysState build() {
    final today = DateTime.now();
    return DaysState(
        visibleDayGrid: DaysRepository.getDaySlice(getDayBlockRange(today)),
        visibleDate: today);
  }

  colorizeDayBlock(BlockId blockId, RoutineId? routineId) {
    state = state.copyWith(
        visibleDayGrid: {...state.visibleDayGrid, blockId: routineId});
    DaysRepository.saveBlock(blockId, routineId);
  }
}
