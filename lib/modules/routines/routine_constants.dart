import 'package:smuzy/modules/color/colors_constants.dart';
import 'package:smuzy/modules/routines/models/routine_model.dart';
import 'package:uuid/uuid.dart';

var defaultRoutines = [
  Routine(
    id: const Uuid().v4(),
    title: 'sleep',
    color: defaultRoutinesColors['teal']!,
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'sport',
    color: defaultRoutinesColors['orange']!,
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'eat',
    color: defaultRoutinesColors['lightGreen']!,
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'work',
    color: defaultRoutinesColors['blueGray']!,
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'media',
    color: defaultRoutinesColors['black']!,
  )
];
