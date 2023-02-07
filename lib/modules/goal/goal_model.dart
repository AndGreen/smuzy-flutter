import 'package:smuzy/modules/routines/models/routine_model.dart';

class GoalRoutine extends Routine {
  final int goalCount;

  GoalRoutine({
    required super.id,
    required super.color,
    required super.title,
    required this.goalCount,
  });
}
