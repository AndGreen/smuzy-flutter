import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/modules/days/day_constants.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_block.dart';

class DayGrid extends HookConsumerWidget {
  const DayGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  rowCount,
                  (row) => Row(
                        children: List.generate(
                            colCount,
                            (col) => DayBlock(
                                  col: col,
                                  row: row,
                                  blockSize: blockSize,
                                )),
                      ))));
    });
  }
}
