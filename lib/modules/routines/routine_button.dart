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

Color getButtonColor(bool isActive) {
  if (isActive) {
    return AppColors.white;
  } else {
    return AppColors.gray;
  }
}

@swidget
Widget routineButton({
  required Color color,
  required String title,
  required Function onTap,
  required bool isActive,
}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: getButtonColor(isActive),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          colorCircle(color: color),
          Text(
            title,
            style: AppFonts.text.copyWith(
                color: isActive ? AppColors.grayDark : AppColors.white),
          )
        ],
      ));
}
