import 'package:flutter/material.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/common/theme/fonts.dart';
import 'package:styled_widget/styled_widget.dart';

Widget _colorCircle(Color color) {
  return const SizedBox(
    width: 18,
    height: 18,
  ).decorated(color: color, shape: BoxShape.circle).padding(right: 8);
}

Color _getTextColor(BuildContext context, bool isActive) {
  if (context.isDarkMode) {
    return isActive ? AppColors.grayDark : AppColors.white;
  } else {
    return isActive ? AppColors.white : AppColors.grayLight;
  }
}

class RoutineLabel extends StatelessWidget {
  const RoutineLabel({
    super.key,
    required this.color,
    required this.title,
    this.isActive = false,
    this.textPadding = 0,
  });

  final Color color;
  final String title;
  final bool isActive;
  final double textPadding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _colorCircle(color),
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: AppFonts.text.copyWith(
            wordSpacing: 0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Roboto',
            color: _getTextColor(context, isActive),
          ),
        ).constrained(maxWidth: 130).padding(left: textPadding)
      ],
    );
  }
}
