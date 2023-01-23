import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/common/widgets/textfiled.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineForm extends StatelessWidget {
  const RoutineForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Routine', style: TextStyle(fontSize: 18)),
        leading: const BackButton(color: AppColors.active),
        actions: [
          Center(
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.active,
              ),
            ).padding(right: 15),
          )
        ],
      ),
      body: Column(
        children: [
          CupertinoFormSection.insetGrouped(
            backgroundColor: Colors.transparent,
            margin: const EdgeInsets.all(0),
            children: [
              CupertinoTextInput(
                label: 'Routine name',
                autofocus: true,
                onChanged: (value) {},
                initialValue: '',
              ),
            ],
          ),
          // TextField(
          //   obscureText: true,
          //   decoration: InputDecoration(
          //     filled: true,
          //     fillColor: AppColors.grayBg,
          //     // border: null,
          //     labelText: 'Routine name',
          //   ),
          // )
        ],
      ).padding(vertical: 20, horizontal: 16),
    );
  }
}
