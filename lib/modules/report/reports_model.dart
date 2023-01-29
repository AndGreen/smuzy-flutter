import 'package:smuzy/modules/routines/models/routine_model.dart';

class RoutineReport extends Routine {
  int diffCount;
  int blockCount;

  RoutineReport({
    required super.id,
    required super.color,
    required super.title,
    required this.blockCount,
    required this.diffCount,
  });
}

extension Sorter on List<RoutineReport> {
  List<RoutineReport> sorted() {
    var newList = toList();
    newList.sort((a, b) => a.diffCount.compareTo(b.diffCount));
    newList.sort((a, b) => b.blockCount.compareTo(a.blockCount));
    return newList;
  }
}
