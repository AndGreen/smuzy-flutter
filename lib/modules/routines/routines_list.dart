import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smuzy_flutter/modules/app/app_conroller.dart';
import 'package:smuzy_flutter/modules/routines/routine_button.dart';

class RoutinesList extends StatelessWidget {
  const RoutinesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController c = Get.find();
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Wrap(spacing: 10, runSpacing: 10, children: [
            ...c.routines.map(
              (e) => RoutineButton(color: e.color, title: e.title),
            )
          ]),
        ));
  }
}
