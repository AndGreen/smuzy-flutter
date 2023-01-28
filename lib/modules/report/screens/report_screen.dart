import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/modules/days/widgets/day_app_bar.dart';
import 'package:smuzy/modules/report/widgets/progress_label.dart';
import 'package:smuzy/modules/routines/routine_provider.dart';
import 'package:smuzy/modules/routines/widgets/routine_label.dart';
import 'package:styled_widget/styled_widget.dart';

class ReportScreen extends HookConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var routines = ref.read(routinesProvider).routines;

    return Scaffold(
      appBar: const DayAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: CupertinoFormSection.insetGrouped(
                backgroundColor: context.colorScheme.background,
                children: routines
                    .map(
                      (e) => CupertinoFormRow(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RoutineLabel(
                                    color: e.color,
                                    title: e.title,
                                    textPadding: 8,
                                  ).padding(vertical: 8),
                                  ProgressLabel(
                                    blockCount:
                                        Random().nextInt(100 + 100) - 100,
                                    showDiff: false,
                                  ).padding(right: 12),
                                ],
                              ),
                            ),
                            ProgressLabel(
                              blockCount: Random().nextInt(100 + 100) - 100,
                              showDiff: true,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
