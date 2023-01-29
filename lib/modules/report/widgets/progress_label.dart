import 'package:flutter/material.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/modules/days/day_constants.dart';

class ProgressLabel extends StatelessWidget {
  const ProgressLabel({
    super.key,
    required this.blockCount,
  });

  final int blockCount;
  get hours => (blockCount.abs() * blockDurationMin) ~/ 60;
  get minutes => (blockCount.abs() * blockDurationMin) % 60;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: blockCount != 0
          ? Text(
              '${blockCount > 0 ? '+' : '-'}${hours}h ${minutes}m',
              style: TextStyle(
                color: blockCount > 0
                    ? AppColors.green
                    : context.colorScheme.onBackground.withOpacity(0.3),
              ),
            )
          : null,
    );
  }
}

class StaticProgressLabel extends ProgressLabel {
  const StaticProgressLabel({
    super.key,
    required super.blockCount,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      blockCount != 0 ? '${hours}h ${minutes}m' : '0h 0m',
      style: TextStyle(
        color: context.colorScheme.onBackground
            .withOpacity(blockCount != 0 ? 1 : 0.3),
        fontWeight: blockCount != 0 ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
