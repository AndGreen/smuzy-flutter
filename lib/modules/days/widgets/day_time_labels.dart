import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class DayTimeLabels extends StatelessWidget {
  const DayTimeLabels({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: List.generate(
            8,
            (index) => SizedBox(
                // TODO: fix dinamic height
                height: 36,
                child: Center(
                  child: Text('${(index * 3).toString().padLeft(2, '0')}:00',
                      style: const TextStyle(fontSize: 12)),
                ))),
      ).padding(vertical: 5),
    ).padding(right: 10);
  }
}
