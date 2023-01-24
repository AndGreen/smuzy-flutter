import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';

class CupertinoTextInput extends StatelessWidget {
  const CupertinoTextInput({
    Key? key,
    required this.label,
    required this.autofocus,
    required this.onChanged,
    this.controller,
    this.initialValue,
    this.validator,
    this.placeholder,
  }) : super(key: key);

  final String label;
  final bool autofocus;
  final String? placeholder;
  final TextEditingController? controller;
  final void Function(String? value) onChanged;
  final String? Function(String? value)? validator;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix:
          Text(label, style: TextStyle(color: Theme.of(context).primaryColor)),
      child: CupertinoTextFormFieldRow(
        textCapitalization: TextCapitalization.sentences,
        autofocus: autofocus,
        controller: controller,
        validator: validator,
        initialValue: initialValue,
        placeholderStyle: TextStyle(color: Theme.of(context).focusColor),
        placeholder: placeholder,
        onChanged: onChanged,
        style: const TextStyle(color: AppColors.active),
      ),
    );
  }
}
