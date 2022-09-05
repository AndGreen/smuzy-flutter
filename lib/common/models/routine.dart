import 'package:flutter/material.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:uuid/uuid.dart';

class Routine {
  final String id = const Uuid().v4();
  final Color color;
  final String title;

  Routine({
    required this.color,
    required this.title,
  });
}

var defaultRoutines = [
  Routine(title: 'sleep', color: AppColors.defaultRoutinesColors['teal']!),
  Routine(title: 'sport', color: AppColors.defaultRoutinesColors['orange']!),
  Routine(title: 'eat', color: AppColors.defaultRoutinesColors['lightGreen']!),
  Routine(title: 'work', color: AppColors.defaultRoutinesColors['blueGray']!),
  Routine(title: 'media', color: AppColors.defaultRoutinesColors['black']!)
];
