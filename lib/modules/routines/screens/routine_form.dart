import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy/modules/routines/models/routine_model.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/common/widgets/textfiled.dart';
import 'package:smuzy/modules/app/navigation.dart';
import 'package:smuzy/modules/color/color_list.dart';
import 'package:smuzy/modules/routines/routine_provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:uuid/uuid.dart';

class RoutineForm extends HookConsumerWidget {
  const RoutineForm({super.key, this.routine});

  final Routine? routine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isNewRoutine = routine == null;

    var routines = ref.watch(routinesProvider).routines;
    var routinesEdit = ref.read(routinesProvider.notifier);
    var usedColors = routines
        .map((routine) => routine.color)
        .where((color) => color != routine?.color)
        .toSet();

    var text = useState<String?>(routine?.title);
    var activeColor = useState<Color?>(routine?.color);

    var isFormValid = text.value != null && activeColor.value != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isNewRoutine ? 'New Routine' : 'Edit Routine',
          style: const TextStyle(fontSize: 18),
        ),
        leading: BackButton(
          color: context.isDarkMode
              ? AppColors.active
              : context.colorScheme.primary,
        ),
        actions: [
          TextButton(
            onPressed: isFormValid
                ? () {
                    isNewRoutine
                        ? routinesEdit.addNewRoutine(
                            Routine(
                              id: const Uuid().v4(),
                              color: activeColor.value!,
                              title: text.value!,
                            ),
                          )
                        : routinesEdit.updateRoutine(
                            Routine(
                              id: routine!.id,
                              color: activeColor.value!,
                              title: text.value!,
                            ),
                          );
                    Navigation.closeModal(context);
                  }
                : null,
            child: Center(
              child: Text(
                'Save',
                style: TextStyle(
                  fontSize: 18,
                  color: (context.isDarkMode
                          ? AppColors.active
                          : context.colorScheme.primary)
                      .withOpacity(isFormValid ? 1 : 0.5),
                ),
              ),
            ),
          ).padding(right: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CupertinoFormSection.insetGrouped(
              backgroundColor: Colors.transparent,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: context.isDarkMode ? AppColors.gray : AppColors.lightBg,
              ),
              margin: const EdgeInsets.all(0),
              children: [
                CupertinoTextInput(
                  label: 'Title',
                  textCapitalization: TextCapitalization.none,
                  autofocus: true,
                  initialValue: text.value,
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
                  routinesEdit.deleteRoutine(routineId: routine!.id);
                  Navigation.closeModal(context);
                },
                child: const Text('Delete Routine').padding(vertical: 15),
              ).padding(vertical: 10)
          ],
        ).padding(vertical: 20, horizontal: 16),
      ),
    );
  }
}
