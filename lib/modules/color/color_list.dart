import 'package:flutter/material.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/modules/color/color_button.dart';

class ColorList extends StatelessWidget {
  const ColorList({
    super.key,
    required this.usedColors,
    required this.activeColor,
    required this.onColorTap,
  });

  final Set<Color> usedColors;
  final Color? activeColor;
  final Function(Color color) onColorTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          ...AppColors.defaultRoutinesColors.values
              .map(
                (color) => ColorButton(
                  onTap: (color) {
                    onColorTap(color);
                  },
                  color: color,
                  isActive: activeColor == color,
                  isUsed: usedColors.contains(color),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
