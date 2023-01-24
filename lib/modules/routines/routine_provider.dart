import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smuzy_flutter/common/models/routine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smuzy_flutter/modules/routines/routine_repository.dart';

part 'routines_provider.freezed.dart';
part 'routines_provider.g.dart';

@freezed
class RoutinesState with _$RoutinesState {
  factory RoutinesState({
    String? activeIdRoutine,
    required Map<RoutineId, Routine> routines,
  }) = _RoutinesState;
}

@riverpod
class Routines extends _$Routines {
  @override
  RoutinesState build() {
    var routines = RoutinesRepository.restoreRoutines();
    if (routines.isEmpty) {
      routines = {for (var routine in defaultRoutines) routine.id: routine};
      RoutinesRepository.saveRoutines(routines);
    }
    return RoutinesState(routines: routines);
  }

  updateRoutine(Routine updatedRoutine) {
    state = state.copyWith(
      routines: state.routines.map((id, routine) {
        if (routine.id == updatedRoutine.id) {
          return MapEntry(routine.id, updatedRoutine);
        }
        return MapEntry(routine.id, routine);
      }),
    );
  }

  addNewRoutine(Routine newRoutine) {
    state = state.copyWith(
      routines: {...state.routines, newRoutine.id: newRoutine},
    );
  }

  toggleActiveRoutine(Routine newRoutine) {
    state = state.copyWith(
      activeIdRoutine:
          state.activeIdRoutine != newRoutine.id ? newRoutine.id : null,
    );
  }
}
