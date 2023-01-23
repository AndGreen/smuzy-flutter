import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smuzy_flutter/common/theme/fonts.dart';
import 'package:smuzy_flutter/common/utils/dates.dart';
import 'package:smuzy_flutter/common/utils/modal.dart';
import 'package:smuzy_flutter/modules/calendar/calendar_modal.dart';
import 'package:smuzy_flutter/modules/days/day_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class DayAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const DayAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visibleDay = ref.watch(dayProvider).visibleDate;

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Modal.open(
                context: context,
                child: CalendarModal(
                  visibleDay: visibleDay,
                  onDaySelect: (selectedDate) {
                    ref
                        .read(dayProvider.notifier)
                        .changeVisibleDate(selectedDate);
                    Modal.close(context);
                  },
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getCurrentFormattedDay(visibleDay), style: AppFonts.title),
                const Icon(
                  Ionicons.chevron_down,
                  size: 18,
                ).padding(left: 5)
              ],
            ).padding(horizontal: 10),
          ),
        ],
      ),
    );
  }
}
