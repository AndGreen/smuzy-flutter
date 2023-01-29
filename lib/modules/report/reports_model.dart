import 'package:smuzy/modules/routines/models/routine_model.dart';

class RoutineReport extends Routine {
  int diffCount;

  RoutineReport({
    required super.id,
    required super.color,
    required super.title,
    required this.diffCount,
  });
}

// TODO add button for sort reports
extension Sorter on List<RoutineReport> {
  List<RoutineReport> sortPosNegZero() {
    final zeroValues = where((i) => i.diffCount == 0).toList();
    final positiveValues = where((i) => i.diffCount > 0).toList();
    final negativeValues = where((i) => i.diffCount < 0).toList();
    return [...positiveValues, ...negativeValues, ...zeroValues];
  }
}
