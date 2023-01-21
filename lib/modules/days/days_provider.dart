import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'days_provider.freezed.dart';
part 'days_provider.g.dart';

typedef BlockId = int;
typedef RoutineId = String;

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
    return DaysState(visibleDayGrid: {}, visibleDate: DateTime.now());
  }

  colorizeDayBlock(BlockId blockId, RoutineId? routineId) {
    state = state.copyWith(
        visibleDayGrid: {...state.visibleDayGrid, blockId: routineId});
  }
}
