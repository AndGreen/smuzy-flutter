import 'package:flutter/material.dart';
import 'package:smuzy/modules/report/reports_model.dart';
import 'package:smuzy/modules/report/widgets/progress_label.dart';
import 'package:smuzy/modules/routines/widgets/routine_label.dart';
import 'package:styled_widget/styled_widget.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({
    required this.routineReport,
    super.key,
  });

  final RoutineReport routineReport;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoutineLabel(
                color: routineReport.color,
                title: routineReport.title,
                textPadding: 8,
              ).padding(vertical: 8),
              StaticProgressLabel(
                blockCount: routineReport.blockCount,
              ).padding(right: 12),
            ],
          ),
        ),
        ProgressLabel(
          blockCount: routineReport.diffCount,
        ),
      ],
    );
  }
}
