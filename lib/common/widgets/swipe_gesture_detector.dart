import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const swipeSpeed = 1300;

class SwipeGestureDetector extends HookWidget {
  const SwipeGestureDetector({
    super.key,
    required this.child,
    this.onSwipeLeftEnd,
    this.onSwipeRightEnd,
  });

  final Function? onSwipeLeftEnd;
  final Function? onSwipeRightEnd;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails endDetails) {
        double? speed = endDetails.velocity.pixelsPerSecond.dx;
        if (speed > swipeSpeed) {
          if (onSwipeLeftEnd != null) onSwipeLeftEnd!();
        }
        if (speed < -swipeSpeed) {
          if (onSwipeRightEnd != null) onSwipeRightEnd!();
        }
      },
      child: child,
    );
  }
}
