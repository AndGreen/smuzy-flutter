import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/common/theme/fonts.dart';
import 'package:smuzy_flutter/common/utils/dates.dart';
import 'package:smuzy_flutter/modules/days/day_provider.dart';

class DayAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const DayAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visibleDay = ref.watch(dayProvider).visibleDate;

    return AppBar(
      title: Text(getCurrentFormattedDay(visibleDay), style: AppFonts.title),
    );
  }
}
