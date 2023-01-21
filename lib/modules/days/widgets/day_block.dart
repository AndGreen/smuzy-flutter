import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class DayBlock extends StatelessWidget {
  const DayBlock(
      {super.key,
      required this.blockSize,
      required this.row,
      required this.col});

  final double blockSize;
  final int col;
  final int row;

  BorderSide getRightBorderSize(int index) {
    // TODO: pattern matching:
    var borderSize = 1.0;
    if ((index + 1) % 3 == 0) {
      borderSize = 3;
    }
    if (index == 8) {
      borderSize = 0;
    }
    return BorderSide(width: borderSize);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: blockSize, height: blockSize).decorated(
        border: row != 7
            ? Border(bottom: const BorderSide(), right: getRightBorderSize(col))
            : Border(right: getRightBorderSize(col)));
  }
}
