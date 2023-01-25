import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/common/widgets/swipe_gesture_detector.dart';
import 'package:smuzy_flutter/modules/days/day_provider.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_grid.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_time_labels.dart';

class DaySection extends HookConsumerWidget {
  const DaySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var dayState = ref.watch(dayProvider);
    var maxHeight = [
      MediaQuery.of(context).size.width * 0.74,
      MediaQuery.of(context).size.height * 0.35
    ].reduce(max);

    return SwipeGestureDetector(
      onSwipeLeftEnd: () {
        ref.read(dayProvider.notifier).changeVisibleDate(
              dayState.visibleDate.subtract(const Duration(days: 1)),
            );
      },
      onSwipeRightEnd: () {
        ref.read(dayProvider.notifier).changeVisibleDate(
              dayState.visibleDate.add(const Duration(days: 1)),
            );
      },
      child: Container(
        color: context.isDarkMode ? AppColors.grayBg : AppColors.lightBg,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxHeight,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                DayTimeLabels(),
                Expanded(
                  child: DayGrid(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
