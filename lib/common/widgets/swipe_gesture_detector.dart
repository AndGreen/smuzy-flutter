import 'package:flutter/material.dart';

class SwipeGestureDetector extends StatelessWidget {
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
      onPanEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx < 1) {
          if (onSwipeRightEnd != null) onSwipeRightEnd!();
        } else {
          if (onSwipeLeftEnd != null) onSwipeLeftEnd!();
        }
      },
      child: child,
    );
  }
}
