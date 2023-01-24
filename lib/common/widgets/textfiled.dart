import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextInput extends StatelessWidget {
  const CupertinoTextInput({
    Key? key,
    required this.label,
    required this.autofocus,
    required this.onChanged,
    this.controller,
    this.validator,
    this.placeholder,
  }) : super(key: key);

  final String label;
  final bool autofocus;
  final String? placeholder;
  final TextEditingController? controller;
  final void Function(String? value) onChanged;
  final String? Function(String? value)? validator;

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
        placeholderStyle: TextStyle(color: Theme.of(context).focusColor),
        placeholder: placeholder,
        onChanged: onChanged,
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
