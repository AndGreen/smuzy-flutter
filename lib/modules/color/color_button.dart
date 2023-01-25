import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:styled_widget/styled_widget.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    Key? key,
    required this.color,
    required this.isUsed,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final bool isUsed;
  final bool isActive;
  final Function(Color color) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isUsed) onTap(color);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color.withOpacity(isUsed ? 0.3 : 1),
          shape: BoxShape.circle,
          border: isActive
              ? Border.all(
                  color: context.isDarkMode ? Colors.white : Colors.black,
                  width: 2,
                )
              : null,
        ),
        child: isActive || isUsed
            ? Center(
                child: Icon(
                  Ionicons.checkmark_outline,
                  color: context.isDarkMode
                      ? Colors.white
                      : (isActive ? Colors.white : Colors.black),
                  size: 23,
                ).opacity(isUsed ? 0.4 : 1),
              )
            : null,
      ),
    );
  }
}
