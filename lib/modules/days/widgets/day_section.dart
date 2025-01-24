import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smuzy/modules/days/widgets/day_grid.dart';
import 'package:smuzy/modules/days/widgets/day_time_labels.dart';

class DaySection extends StatelessWidget {
  const DaySection({super.key});

  @override
  Widget build(BuildContext context) {
    var maxHeight = [
      MediaQuery.of(context).size.width * 0.74,
      MediaQuery.of(context).size.height * 0.35,
    ].reduce(max);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
