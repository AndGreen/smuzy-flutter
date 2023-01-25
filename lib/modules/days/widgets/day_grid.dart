import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/common/utils/dates.dart';
import 'package:smuzy_flutter/modules/days/day_constants.dart';
import 'package:smuzy_flutter/modules/days/day_provider.dart';
import 'package:smuzy_flutter/modules/days/day_utils.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_block.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_now_block.dart';

class DayGrid extends HookConsumerWidget {
  const DayGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visibleDate = ref.watch(dayProvider).visibleDate;
    var visibleBlockRange = getDayBlockRange(visibleDate);

    var nowBlockId = useState(getBlockId(DateTime.now()));

    // TODO: make cusom hook or use global state
    useEffect(
      () {
        final time = Stream.periodic(const Duration(seconds: 1));
        var listener = time.listen((_) {
          final currentBlockId = getBlockId(DateTime.now());
          if (currentBlockId != nowBlockId.value) {
            nowBlockId.value = currentBlockId;
          }
        });
        return () {
          listener.cancel();
        };
      },
      [],
    );

    var nowBlockIndex = visibleBlockRange.indexOf(nowBlockId.value);

    return LayoutBuilder(
      builder: (context, constrains) {
        var blockSize = (constrains.maxWidth - 2) / 9;

        return Stack(
          children: [
            Container(
              height: blockSize * 8 + 2,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.isDarkMode
                      ? AppColors.grayDark
                      : AppColors.borderLight,
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
                        nowBlockId: nowBlockId.value,
                        blockSize: blockSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (visibleDate.isSameDay(DateTime.now()))
              DayNowBlock(
                blockSize: blockSize,
                nowBlockIndex: nowBlockIndex,
              )
          ],
        );
      },
    );
  }
}
