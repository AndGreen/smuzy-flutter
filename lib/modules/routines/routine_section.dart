import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/common/utils/modal.dart';
import 'package:smuzy_flutter/modules/routines/routine_provider.dart';
import 'package:smuzy_flutter/modules/routines/screens/routine_form.dart';
import 'package:smuzy_flutter/modules/routines/widgets/add_routine_button.dart';
import 'package:smuzy_flutter/modules/routines/widgets/routine_button.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineSection extends HookConsumerWidget {
  const RoutineSection({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final routinesState = ref.watch(routinesProvider);

    return Wrap(
      spacing: 10,
      runSpacing: 2,
      children: [
        ...routinesState.routines.values.toList().map(
              (routine) => GestureDetector(
                onLongPress: () {
                  Modal.open(
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
                ),
              ),
            ),
        AddRoutineButton(
          onTap: () {
            Modal.open(
              context: context,
              child: const RoutineForm(),
            );
          },
        ),
      ],
    ).padding(vertical: 8, horizontal: 8);
  }
}
