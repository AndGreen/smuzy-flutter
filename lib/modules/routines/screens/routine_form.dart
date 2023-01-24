import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/common/models/routine.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/common/utils/modal.dart';
import 'package:smuzy_flutter/common/widgets/textfiled.dart';
import 'package:smuzy_flutter/modules/color/color_list.dart';
import 'package:smuzy_flutter/modules/routines/routine_provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:uuid/uuid.dart';

class RoutineForm extends HookConsumerWidget {
  const RoutineForm({super.key, this.routine});

  final Routine? routine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var text = useState<String?>(null);
    var isNewRoutine = routine == null;

    var routines = ref.watch(routinesProvider).routines;
    var addNewRoutine = ref.read(routinesProvider.notifier).addNewRoutine;
    var usedColors = routines.values.map((routine) => routine.color).toSet();
    var activeColor = useState<Color?>(null);

    var isFormValid = text.value != null && activeColor.value != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isNewRoutine ? 'New Routine' : 'Edit Routine',
          style: const TextStyle(fontSize: 18),
        ),
        leading: const BackButton(color: AppColors.active),
        actions: [
          TextButton(
            onPressed: isFormValid
                ? () {
                    addNewRoutine(
                      Routine(
                        id: const Uuid().v4(),
                        color: activeColor.value!,
                        title: text.value!,
                      ),
                    );
                    Modal.close(context);
                  }
                : null,
            child: Center(
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.active.withOpacity(isFormValid ? 1 : 0.5),
                ),
              ),
            ),
          ).padding(right: 10)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoFormSection.insetGrouped(
            backgroundColor: Colors.transparent,
            margin: const EdgeInsets.all(0),
            children: [
              CupertinoTextInput(
                label: 'Title',
                autofocus: true,
                onChanged: (value) {
                  text.value = value;
                },
              ),
            ],
          ),
          ColorList(
            usedColors: usedColors,
            activeColor: activeColor.value,
            onColorTap: (color) {
              activeColor.value = color;
            },
          ).padding(top: 30, bottom: 20),
          if (!isNewRoutine)
            ElevatedButton(
              onPressed: () {
                // onDaySelect(DateTime.now());
              },
              child: const Text('Delete Routine').padding(vertical: 15),
            ).padding(vertical: 10)
        ],
      ).padding(vertical: 20, horizontal: 16),
    );
  }
}
