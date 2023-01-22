import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:uuid/uuid.dart';

part 'routine.g.dart';

typedef BlockId = int;
typedef RoutineId = String;

@HiveType(typeId: 0)
class RoutineHive {
  @HiveField(0)
  final RoutineId id;
  @HiveField(1)
  int colorValue;
  @HiveField(2)
  final String title;

  RoutineHive({
    required this.id,
    required this.colorValue,
    required this.title,
  });
}

class Routine {
  RoutineId id;
  Color color;
  final String title;

  Routine({
    required this.id,
    required this.color,
    required this.title,
  });
}

var defaultRoutines = [
  Routine(
      id: const Uuid().v4(),
      title: 'sleep',
      color: AppColors.defaultRoutinesColors['teal']!),
  Routine(
      id: const Uuid().v4(),
      title: 'sport',
      color: AppColors.defaultRoutinesColors['orange']!),
  Routine(
      id: const Uuid().v4(),
      title: 'eat',
      color: AppColors.defaultRoutinesColors['lightGreen']!),
  Routine(
      id: const Uuid().v4(),
      title: 'work',
      color: AppColors.defaultRoutinesColors['blueGray']!),
  Routine(
      id: const Uuid().v4(),
      title: 'media',
      color: AppColors.defaultRoutinesColors['black']!)
];
