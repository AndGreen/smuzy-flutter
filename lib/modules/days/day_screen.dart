import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:smuzy_flutter/common/theme/fonts.dart';
import 'package:smuzy_flutter/common/utils/dates.dart';
import 'package:smuzy_flutter/modules/routines/routines_list.dart';

part 'day_screen.g.dart';

@swidget
Widget dayScreen() {
  return Scaffold(
    appBar: AppBar(
      title: Text(getCurrentFormattedDay(), style: AppFonts.title),
    ),
    body: Column(
      children: const [RoutinesList()],
    ),
  );
}
