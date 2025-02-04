import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy/modules/app/navigation.dart';
import 'package:smuzy/modules/routines/routine_provider.dart';
import 'package:smuzy/modules/routines/screens/routine_form.dart';
import 'package:smuzy/modules/routines/widgets/add_routine_button.dart';
import 'package:smuzy/modules/routines/widgets/routine_button.dart';
// import 'package:styled_widget/styled_widget.dart';

class RoutineList extends HookConsumerWidget {
  const RoutineList({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final routinesState = ref.watch(routinesProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 10,
          runSpacing: 2,
          // alignment: WrapAlignment.center,
          children: [
            ...routinesState.routines.mapIndexed(
              (index, routine) => GestureDetector(
                  onLongPress: () {
                    Navigation.openModal(
                      context: context,
                      child: RoutineForm(
                        routine: routine,
                      ),
                    );
                  },
                  child: RoutineButton(
                    color: routine.color,
                    title: routine.title,
                    isActive: routine.id == routinesState.activeIdRoutine,
                    onTap: () {
                      ref
                          .read(routinesProvider.notifier)
                          .toggleActiveRoutine(routine);
                    },
                  )),
            ),
            AddRoutineButton(
              onTap: () {
                Navigation.openModal(
                  context: context,
                  child: const RoutineForm(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
