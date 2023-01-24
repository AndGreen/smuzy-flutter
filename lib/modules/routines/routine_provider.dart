import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smuzy_flutter/modules/routines/models/routine_model.dart';
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
    var routines = RoutinesRepository.getRoutines();
    if (routines.isEmpty) {
      routines = {for (var routine in defaultRoutines) routine.id: routine};
      RoutinesRepository.saveRoutines(routines);
    }
    return RoutinesState(routines: routines);
  }

  restoreRoutines(Map<RoutineId, Routine> routines) {
    state = state.copyWith(routines: routines);
    RoutinesRepository.saveRoutines(routines);
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
    RoutinesRepository.saveRoutines(state.routines);
  }

  addNewRoutine(Routine newRoutine) {
    state = state.copyWith(
      routines: {...state.routines, newRoutine.id: newRoutine},
    );
    RoutinesRepository.saveRoutines(state.routines);
  }

  deleteRoutine({required RoutineId routineId}) {
    state = state.copyWith(
      routines: Map.fromEntries(
        state.routines.entries.where((entry) => entry.key != routineId),
      ),
    );
    RoutinesRepository.saveRoutines(state.routines);
  }

  toggleActiveRoutine(Routine newRoutine) {
    state = state.copyWith(
      activeIdRoutine:
          state.activeIdRoutine != newRoutine.id ? newRoutine.id : null,
    );
  }
}
