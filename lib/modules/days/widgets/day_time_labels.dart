import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class DayTimeLabels extends StatelessWidget {
  const DayTimeLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        8,
        (index) => Text(
          '${(index * 3).toString().padLeft(2, '0')}:00',
          style: const TextStyle(fontSize: 12),
        ).opacity(0.3),
      ),
    ).padding(vertical: 5, right: 10);
  }
}
