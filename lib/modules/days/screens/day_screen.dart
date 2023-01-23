import 'package:flutter/material.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_app_bar.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_section.dart';
import 'package:smuzy_flutter/modules/routines/routine_section.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DayAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [DaySection(), RoutineSection()],
      ),
    );
  }
}
