import 'package:flutter/material.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_block_row.dart';

class DayGrid extends StatelessWidget {
  const DayGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      var blockSize = (constrains.maxWidth - 2) / 9;
      return Container(
          height: blockSize * 8 + 2,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
              children: List.generate(
                  8,
                  (index) => DayBlockRow(
                        blockSize: blockSize,
                        row: index,
                      ))));
    });
  }
}
