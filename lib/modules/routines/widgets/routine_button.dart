import 'package:flutter/material.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/common/theme/fonts.dart';
import 'package:styled_widget/styled_widget.dart';

class RoutineButton extends StatelessWidget {
  const RoutineButton({
    super.key,
    required this.color,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  final Color color;
  final String title;
  final Function onTap;
  final bool isActive;

  Color _getButtonColor(BuildContext context, bool isActive) {
    //TODO Dart3: pattern matching
    if (context.isDarkMode) {
      return isActive ? AppColors.white : AppColors.grayDark;
    } else {
      return isActive ? AppColors.grayDark : AppColors.white;
    }
  }

  Color _getTextColor(BuildContext context, bool isActive) {
    if (context.isDarkMode) {
      return isActive ? AppColors.grayDark : AppColors.white;
    } else {
      return isActive ? AppColors.white : AppColors.grayLight;
    }
  }

  Widget _colorCircle(Color color) {
    return const SizedBox(
      width: 18,
      height: 18,
    ).decorated(color: color, shape: BoxShape.circle).padding(right: 8);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(context, isActive),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
          _colorCircle(color),
          Text(
            title,
            style: AppFonts.text.copyWith(
              wordSpacing: 0,
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
              color: _getTextColor(context, isActive),
            ),
          )
        ],
      ),
    );
  }
}
