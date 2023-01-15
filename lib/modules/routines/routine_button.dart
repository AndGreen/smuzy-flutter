import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:smuzy_flutter/common/theme/fonts.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../common/theme/colors.dart';

part 'routine_button.g.dart';

@swidget
Widget colorCircle({
  required Color color,
}) {
  return const SizedBox(
    width: 18,
    height: 18,
  ).decorated(color: color, shape: BoxShape.circle).padding(right: 8);
}

@swidget
Widget routineButton({
  required Color color,
  required String title,
}) {
  return SizedBox(
          child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      colorCircle(color: color),
      Text(
        title,
        style: AppFonts.text,
      )
    ],
  ).padding(horizontal: 12, vertical: 10))
      .decorated(color: AppColors.gray, borderRadius: BorderRadius.circular(8));
}
