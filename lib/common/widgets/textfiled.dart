import 'package:flutter/cupertino.dart';
import 'package:smuzy/common/theme/colors.dart';

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
    this.textCapitalization = TextCapitalization.sentences,
  }) : super(key: key);

  final String label;
  final bool autofocus;
  final String? placeholder;
  final TextEditingController? controller;
  final void Function(String? value) onChanged;
  final String? Function(String? value)? validator;
  final String? initialValue;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: Text(label, style: TextStyle(color: context.colorScheme.primary)),
      child: CupertinoTextFormFieldRow(
        textCapitalization: textCapitalization,
        autofocus: autofocus,
        controller: controller,
        validator: validator,
        initialValue: initialValue,
        placeholderStyle: TextStyle(color: context.theme.focusColor),
        placeholder: placeholder,
        onChanged: onChanged,
        style: TextStyle(
          color: context.isDarkMode
              ? AppColors.active
              : context.colorScheme.primary,
        ),
      ),
    );
  }
}
