import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smuzy/modules/routines/models/routine_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smuzy/modules/routines/routine_repository.dart';

part 'routine_provider.freezed.dart';
part 'routine_provider.g.dart';

@freezed
class RoutineState with _$RoutineState {
  factory RoutineState({
    String? activeIdRoutine,
    required List<Routine> routines,
  }) = _RoutinesState;
}

@riverpod
class Routines extends _$Routines {
  @override
  RoutineState build() {
    var routines = RoutinesRepository.getRoutines();
    if (routines.isEmpty) {
      routines = defaultRoutines;
      RoutinesRepository.updateRoutines(routines);
    }
    return RoutineState(routines: routines);
  }

  restoreRoutines(List<Routine> routines) async {
    await RoutinesRepository.clear();
    state = state.copyWith(routines: routines);
    RoutinesRepository.updateRoutines(routines);
  }

  updateRoutine(Routine updatedRoutine) {
    state = state.copyWith(
      routines: state.routines.map((routine) {
        if (routine.id == updatedRoutine.id) {
          return updatedRoutine;
        }
        return routine;
      }).toList(),
    );

    RoutinesRepository.updateRoutines(state.routines);
  }

  addNewRoutine(Routine newRoutine) {
    state = state.copyWith(
      routines: [...state.routines, newRoutine],
    );
    RoutinesRepository.updateRoutines(state.routines);
  }

  deleteRoutine({required RoutineId routineId}) {
    state = state.copyWith(
      routines:
          state.routines.where((routine) => routine.id != routineId).toList(),
    );
    RoutinesRepository.updateRoutines(state.routines);
  }

  toggleActiveRoutine(Routine newRoutine) {
    state = state.copyWith(
      activeIdRoutine:
          state.activeIdRoutine != newRoutine.id ? newRoutine.id : null,
    );
  }
}
