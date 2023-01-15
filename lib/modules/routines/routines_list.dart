import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:get/get.dart';
import 'package:smuzy_flutter/modules/app/app_conroller.dart';
import 'package:smuzy_flutter/modules/routines/routine_button.dart';
import 'package:styled_widget/styled_widget.dart';

part 'routines_list.g.dart';

@swidget
Widget routinesList() {
  AppController c = Get.find();

  return Obx(() => Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          ...c.routines.map(
            (e) => RoutineButton(color: e.color, title: e.title),
          )
        ],
      ).padding(vertical: 12, horizontal: 10));
}
