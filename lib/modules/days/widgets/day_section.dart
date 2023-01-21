import 'package:flutter/material.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_grid.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_time_labels.dart';

class DaySection extends StatelessWidget {
  const DaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
