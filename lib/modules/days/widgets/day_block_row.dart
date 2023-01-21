import 'package:flutter/material.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_block.dart';

class DayBlockRow extends StatelessWidget {
  const DayBlockRow({super.key, required this.blockSize, required this.row});

  final double blockSize;
  final int row;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          9,
          (index) => DayBlock(
                col: index,
                row: row,
                blockSize: blockSize,
              )),
    );
  }
}
