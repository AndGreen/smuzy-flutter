import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smuzy/modules/days/day_provider.dart';
import 'package:smuzy/modules/report/reports_model.dart';
import 'package:smuzy/modules/routines/routine_provider.dart';

part 'reports_provider.freezed.dart';
part 'reports_provider.g.dart';

@freezed
class ReportsState with _$ReportsState {
  factory ReportsState({
    required List<RoutineReport> routinesReports,
  }) = _ReportsState;
}

@riverpod
class Reports extends _$Reports {
  @override
  ReportsState build() {
    var routines = ref.watch(routinesProvider).routines;
    var dayState = ref.watch(dayProvider);
    var prevDayGrid = ref
        .read(dayProvider.notifier)
        .getDayGrid(dayState.visibleDate.subtract(const Duration(days: 1)));

    var routinesReports = routines
        .map(
          (routine) => RoutineReport(
            id: routine.id,
            color: routine.color,
            title: routine.title,
            blockCount: 0,
            diffCount: 0,
          ),
        )
        .toList();

    dayState.visibleDayGrid.forEach((blockId, routineId) {
      var index =
          routinesReports.indexWhere((element) => element.id == routineId);

      if (index > 0) {
        routinesReports[index].blockCount += 1;
        routinesReports[index].diffCount += 1;
      }
    });

    prevDayGrid.forEach((blockId, routineId) {
      var index =
          routinesReports.indexWhere((element) => element.id == routineId);
      if (index > 0) routinesReports[index].diffCount -= 1;
    });

    return ReportsState(
      routinesReports: routinesReports
        ..sort((a, b) => b.blockCount.compareTo(a.blockCount)),
    );
  }
}
