import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy/common/widgets/swipe_gesture_detector.dart';
import 'package:smuzy/modules/days/day_provider.dart';

class DayChangeOnSwipe extends HookConsumerWidget {
  const DayChangeOnSwipe({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var dayState = ref.watch(dayProvider);

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
      child: child,
    );
  }
}
