import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy/modules/routines/models/routine_model.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/common/utils/dates.dart';
import 'package:smuzy/modules/days/day_provider.dart';
import 'package:smuzy/modules/days/day_utils.dart';
import 'package:smuzy/modules/routines/routine_provider.dart';

class DayBlock extends HookConsumerWidget {
  const DayBlock({
    super.key,
    required this.blockSize,
    required this.row,
    required this.col,
    required this.nowBlockId,
  });

  final double blockSize;
  final int col;
  final int row;
  final int nowBlockId;

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

    final blockColor = routinesState.routines
        .firstWhereOrNull((element) => element.id == routineId)
        ?.color;

    final activeColor = routinesState.routines
        .firstWhereOrNull(
          (element) => element.id == routinesState.activeIdRoutine,
        )
        ?.color;

    final patternColor =
        context.isDarkMode ? AppColors.grayDark : AppColors.borderLight;

    double rightBorderSide = getRightBorderSize(col);
    double bottomBorderSide = row != 7 ? 1 : 0;

    double blockWidth = blockSize - rightBorderSide;
    double blockHeight = blockSize - bottomBorderSide;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: bottomBorderSide > 0
              ? BorderSide(
                  color: context.isDarkMode
                      ? AppColors.grayDark
                      : AppColors.borderLight,
                )
              : BorderSide.none,
          right: col != 8
              ? BorderSide(
                  width: rightBorderSide,
                  color: context.isDarkMode
                      ? AppColors.grayDark
                      : AppColors.borderLight,
                )
              : BorderSide.none,
        ),
      ),
      child: SizedBox(
        width: blockWidth,
        height: blockHeight,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: blockColor?.withOpacity(0.8) ?? Colors.transparent,
                gradient: blockId > nowBlockId
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: const Alignment(-0.8, -0.8),
                        stops: const [0.0, 0.9, 0, 0],
                        colors: [
                          blockColor ?? patternColor,
                          blockColor ?? patternColor,
                          patternColor,
                          patternColor,
                        ],
                        tileMode: TileMode.repeated,
                      )
                    : null,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTapUp: (_) {
                  HapticFeedback.lightImpact();
                },
                splashColor: activeColor,
                onTap: () {
                  ref.read(dayProvider.notifier).colorizeDayBlock(
                        blockId,
                        routinesState.activeIdRoutine,
                      );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
