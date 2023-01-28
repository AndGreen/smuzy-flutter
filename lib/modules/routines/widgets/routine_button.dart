import 'package:flutter/material.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/modules/routines/widgets/routine_label.dart';

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
      child: RoutineLabel(
        color: color,
        title: title,
        isActive: isActive,
      ),
    );
  }
}
