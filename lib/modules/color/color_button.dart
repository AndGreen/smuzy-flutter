import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

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
          border: isActive ? Border.all(color: Colors.white, width: 2) : null,
        ),
        child: isActive || isUsed
            ? const Center(
                child: Icon(
                  Ionicons.checkmark_outline,
                  size: 23,
                ),
              )
            : null,
      ),
    );
  }
}
