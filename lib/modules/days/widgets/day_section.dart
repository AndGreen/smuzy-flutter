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

    return SwipeGestureDetector(
      onSwipeLeftEnd: () {
        ref.read(dayProvider.notifier).changeVisibleDate(
            dayState.visibleDate.subtract(const Duration(days: 1)));
      },
      onSwipeRightEnd: () {
        ref.read(dayProvider.notifier).changeVisibleDate(
            dayState.visibleDate.add(const Duration(days: 1)));
      },
      child: Container(
        color: AppColors.grayBg,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: const [
            DayTimeLabels(),
            Expanded(
              child: DayGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
