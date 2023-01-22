import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/modules/routines/routines_provider.dart';
import 'package:smuzy_flutter/modules/routines/routine_button.dart';
import 'package:styled_widget/styled_widget.dart';

part 'routines_section.g.dart';

@hcwidget
Widget routinesSection(WidgetRef ref) {
  final routinesState = ref.watch(routinesProvider);

  return Wrap(
    spacing: 10,
    runSpacing: 2,
    children: [
      ...routinesState.routines.values.toList().map(
            (routine) => RoutineButton(
                color: routine.color,
                title: routine.title,
                isActive: routine.id == routinesState.activeIdRoutine,
                onTap: () {
                  ref
                      .read(routinesProvider.notifier)
                      .toggleActiveRoutine(routine);
                }),
          )
    ],
  ).padding(vertical: 8, horizontal: 8);
}
