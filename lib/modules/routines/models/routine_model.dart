import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:uuid/uuid.dart';

part 'routine_model.g.dart';

class ColorSerialiser implements JsonConverter<Color, int> {
  const ColorSerialiser();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}

typedef BlockId = int;
typedef RoutineId = String;

@JsonSerializable()
@HiveType(typeId: 0)
class Routine {
  @HiveField(0)
  final RoutineId id;
  @HiveField(1)
  @ColorSerialiser()
  Color color;
  @HiveField(2)
  final String title;

  Routine({
    required this.id,
    required this.color,
    required this.title,
  });

  factory Routine.fromJson(Map<String, dynamic> json) =>
      _$RoutineFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineToJson(this);
}

var defaultRoutines = [
  Routine(
    id: const Uuid().v4(),
    title: 'sleep',
    color: AppColors.defaultRoutinesColors['teal']!,
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'sport',
    color: AppColors.defaultRoutinesColors['orange']!,
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'eat',
    color: AppColors.defaultRoutinesColors['lightGreen']!,
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'work',
    color: AppColors.defaultRoutinesColors['blueGray']!,
  ),
  Routine(
    id: const Uuid().v4(),
    title: 'media',
    color: AppColors.defaultRoutinesColors['black']!,
  )
];
