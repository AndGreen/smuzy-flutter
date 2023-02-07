import 'package:flutter/material.dart';
import 'package:smuzy/modules/days/widgets/day_app_bar.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DayAppBar(),
      body: Center(
        child: Text('Goal'),
      ),
    );
  }
}
