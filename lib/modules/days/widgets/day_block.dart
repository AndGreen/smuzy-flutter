import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/common/models/routine.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/common/utils/dates.dart';
import 'package:smuzy_flutter/modules/days/day_provider.dart';
import 'package:smuzy_flutter/modules/days/day_utils.dart';
import 'package:smuzy_flutter/modules/routines/routine_provider.dart';

class DayBlock extends HookConsumerWidget {
  const DayBlock({
    super.key,
    required this.blockSize,
    required this.row,
    required this.col,
  });

  final double blockSize;
  final int col;
  final int row;

  double getRightBorderSize(int index) {
    // TODO: pattern matching:
    var borderSize = 1.0;
    if ((index + 1) % 3 == 0) {
      borderSize = 3;
    }
    if (index == 8) {
      borderSize = 0;
    }
    return borderSize;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daysState = ref.watch(dayProvider);
    final routinesState = ref.watch(routinesProvider);

    BlockId blockId =
        getBlockId(daysState.visibleDate.startOfDay, row * 9 + col);
    RoutineId? routineId = daysState.visibleDayGrid[blockId];

    final blockColor = routinesState.routines[routineId]?.color;
    final activeColor =
        routinesState.routines[routinesState.activeIdRoutine]?.color;

    double rightBorderSide = getRightBorderSize(col);
    double bottomBorderSide = row != 7 ? 1 : 0;

    double blockWidth = blockSize - rightBorderSide;
    double blockHeight = blockSize - bottomBorderSide;

    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    bottomBorderSide > 0 ? const BorderSide() : BorderSide.none,
                right: BorderSide(width: rightBorderSide))),
        child: SizedBox(
          width: blockWidth,
          height: blockHeight,
          child: Stack(children: [
            Container(color: blockColor),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTapUp: (_) {
                  HapticFeedback.lightImpact();
                },
                splashColor: activeColor ?? AppColors.grayBg,
                onTap: () {
                  ref
                      .read(dayProvider.notifier)
                      .colorizeDayBlock(blockId, routinesState.activeIdRoutine);
                },
              ),
            ),
          ]),
        ));
  }
}
