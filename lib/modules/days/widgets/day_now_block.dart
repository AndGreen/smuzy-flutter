import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/modules/days/day_constants.dart';
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
        ).decorated(border: Border.all(width: 3, color: AppColors.active)),
      ),
    );
  }
}
