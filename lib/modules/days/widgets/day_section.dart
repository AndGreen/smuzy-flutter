import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/modules/days/widgets/day_grid.dart';
import 'package:smuzy/modules/days/widgets/day_time_labels.dart';

class DaySection extends StatelessWidget {
  const DaySection({super.key});

  @override
  Widget build(BuildContext context) {
    var maxHeight = [
      MediaQuery.of(context).size.width * 0.74,
      MediaQuery.of(context).size.height * 0.35
    ].reduce(max);

    return Container(
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
    );
  }
}
