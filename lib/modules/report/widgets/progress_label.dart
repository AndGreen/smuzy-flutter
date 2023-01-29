import 'package:flutter/material.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/modules/days/day_constants.dart';

class ProgressLabel extends StatelessWidget {
  const ProgressLabel({
    super.key,
    required this.blockCount,
    required this.showDiff,
  });

  final int blockCount;
  final bool showDiff;

  @override
  Widget build(BuildContext context) {
    // TODO use datetime format and duration?
    var hours = (blockCount.abs() * blockDurationMin) ~/ 60;
    var menutes = (blockCount.abs() * blockDurationMin) % 60;

    if (!showDiff) {
      return Text(
        blockCount != 0 ? '${hours}h ${menutes}m' : '',
        style: TextStyle(
          color: context.colorScheme.onBackground,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return SizedBox(
      width: 80,
      child: blockCount != 0
          ? Text(
              '${blockCount > 0 ? '+' : '-'}${hours}h ${menutes}m',
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
