import 'package:flutter/material.dart';
import 'package:smuzy/modules/days/widgets/day_app_bar.dart';
import 'package:smuzy/modules/days/widgets/day_section.dart';
import 'package:smuzy/modules/routines/widgets/routine_list.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DayAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [DaySection(), Expanded(child: RoutineList())],
      ),
    );
  }
}
