import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smuzy/modules/goal/goal_model.dart';

part 'goal_provider.freezed.dart';
part 'goal_provider.g.dart';

@freezed
class GoalState with _$GoalState {
  factory GoalState({
    required List<GoalRoutine> visibleGoals,
  }) = _GoalState;
}

@riverpod
class Day extends _$Day {
  @override
  GoalState build() {
    final today = DateTime.now();
    return GoalState(
      visibleGoals: [],
    );
  }
}
