import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:uuid/uuid.dart';

part 'routine.g.dart';

typedef BlockId = int;
typedef RoutineId = String;

@HiveType(typeId: 0)
class Routine {
  @HiveField(0)
  final RoutineId id;
  @HiveField(1)
  late int _color;
  @HiveField(2)
  final String title;

  Color get color => Color(_color);
  set color(Color color) => _color = color.value;

  Routine({
    required this.id,
    color = Colors.black,
    required this.title,
  }) : _color = color.value;
}

var defaultRoutines = [
  Routine(
    id: const Uuid().v4(),
    title: 'sleep',
    color: AppColors.defaultRoutinesColors['teal'],
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'sport',
    color: AppColors.defaultRoutinesColors['orange'],
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'eat',
    color: AppColors.defaultRoutinesColors['lightGreen'],
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'work',
    color: AppColors.defaultRoutinesColors['blueGray'],
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'media',
    color: AppColors.defaultRoutinesColors['black'],
  )
];
