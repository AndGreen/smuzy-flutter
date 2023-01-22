import 'package:flutter/material.dart';
import 'package:smuzy_flutter/common/theme/fonts.dart';
import 'package:smuzy_flutter/common/utils/dates.dart';
import 'package:smuzy_flutter/modules/days/widgets/day_section.dart';
import 'package:smuzy_flutter/modules/routines/routine_section.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getCurrentFormattedDay(), style: AppFonts.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [DaySection(), RoutinesSection()],
      ),
    );
  }
}
