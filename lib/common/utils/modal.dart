import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Modal {
  static void open({
    required BuildContext context,
    required Widget child,
  }) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => child,
    );
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
