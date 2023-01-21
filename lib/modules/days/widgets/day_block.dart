import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/modules/days/days_provider.dart';
import 'package:smuzy_flutter/modules/routines/routines_provider.dart';
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically

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

  BorderSide getRightBorderSize(int index) {
    // TODO: pattern matching:
    var borderSize = 1.0;
    if ((index + 1) % 3 == 0) {
      borderSize = 3;
    }
    if (index == 8) {
      borderSize = 0;
    }
    return BorderSide(width: borderSize);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daysState = ref.watch(daysProvider);
    final routinesState = ref.watch(routinesProvider);

    BlockId getBlockId(DateTime day, int offset) {
      DateTime today = DateTime(day.year, day.month, day.day);
      int timestamp = today.toUtc().millisecondsSinceEpoch;
      int blocks = (timestamp / 1000 / 1200).floor();
      int id = blocks + offset;
      return id;
    }

    BlockId blockId = getBlockId(daysState.visibleDate, row * 9 + col);

    final blockColor = routinesState.routines
        .firstWhereOrNull(
            (element) => element.id == daysState.visibleDayGrid[blockId])
        ?.color;

    final activeColor = routinesState.routines
        .firstWhereOrNull(
            (element) => element.id == routinesState.activeIdRoutine)
        ?.color;

    return SizedBox(
      width: blockSize,
      height: blockSize,
      child: Material(
        child: InkWell(
          onTapUp: (_) {
            HapticFeedback.lightImpact();
          },
          splashColor: activeColor,
          onTap: () {
            ref
                .read(daysProvider.notifier)
                .colorizeDayBlock(blockId, routinesState.activeIdRoutine);
          },
          child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  border: row != 7
                      ? Border(
                          bottom: const BorderSide(),
                          right: getRightBorderSize(col))
                      : Border(right: getRightBorderSize(col))),
              child: SizedBox(child: Container(color: blockColor))),
        ),
      ),
    );
  }
}
