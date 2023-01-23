import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/modules/days/day_constants.dart';
import 'package:smuzy_flutter/modules/days/day_utils.dart';
import 'package:styled_widget/styled_widget.dart';

class DayNowBlock extends HookWidget {
  const DayNowBlock(
      {super.key, required this.blockSize, required this.visibleDate});

  final double blockSize;
  final DateTime visibleDate;

  @override
  Widget build(BuildContext context) {
    var visibleBlockRange = getDayBlockRange(visibleDate);

    var nowBlockId = useState(getBlockId(DateTime.now()));

    useEffect(() {
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
    }, []);

    var nowBlockIndex = visibleBlockRange.indexOf(nowBlockId.value);
    var row = (nowBlockIndex / colCount).floor();
    var col = nowBlockIndex % colCount;

    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        top: blockSize * row,
        left: blockSize * col,
        child: IgnorePointer(
          child: SizedBox(
            width: blockSize,
            height: blockSize,
          ).decorated(border: Border.all(width: 3, color: AppColors.active)),
        ));
  }
}
