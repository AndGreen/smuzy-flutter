import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
      onHorizontalDragEnd: (endDetails) {
        double? velocity = endDetails.primaryVelocity;
        if (velocity != null && velocity > 0) {
          if (onSwipeLeftEnd != null) onSwipeLeftEnd!();
        } else {
          if (onSwipeRightEnd != null) onSwipeRightEnd!();
        }
      },
      child: child,
    );
  }
}
