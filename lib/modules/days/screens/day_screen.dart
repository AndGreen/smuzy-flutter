import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy/modules/days/day_provider.dart';
import 'package:smuzy/modules/days/widgets/day_app_bar.dart';
import 'package:smuzy/modules/days/widgets/day_change_on_swipe.dart';
import 'package:smuzy/modules/days/widgets/day_section.dart';
import 'package:smuzy/modules/routines/widgets/routine_list.dart';

class DayScreen extends HookConsumerWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PageController(initialPage: 999);
    var dayState = ref.watch(dayProvider);

    return const Scaffold(
      appBar: DayAppBar(),
      body: DayChangeOnSwipe(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DaySection(),
            SizedBox(height: 10),
            Expanded(child: RoutineList()),
          ],
        ),
      ),
    );
  }
}
