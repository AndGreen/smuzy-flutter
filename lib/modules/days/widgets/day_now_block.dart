import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/modules/days/day_constants.dart';
import 'package:styled_widget/styled_widget.dart';

class DayNowBlock extends HookWidget {
  const DayNowBlock({
    super.key,
    required this.blockSize,
    required this.nowBlockIndex,
  });

  final double blockSize;
  final int nowBlockIndex;

  @override
  Widget build(BuildContext context) {
    var row = (nowBlockIndex / colCount).floor();
    var col = nowBlockIndex % colCount;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      top: blockSize * row + 1,
      left: blockSize * col,
      child: IgnorePointer(
        child: SizedBox(
          width: blockSize,
          height: blockSize,
        ).decorated(
          boxShadow: [
            BoxShadow(
              color: context.isDarkMode
                  ? Colors.black
                  : Colors.black.withOpacity(0.5),
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
          border: Border.all(
            width: 3,
            color: context.isDarkMode
                ? AppColors.active
                : context.colorScheme.background,
          ),
        ),
      ),
    );
  }
}
