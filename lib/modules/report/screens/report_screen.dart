import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/modules/days/widgets/day_app_bar.dart';
import 'package:smuzy/modules/days/widgets/day_change_on_swipe.dart';
import 'package:smuzy/modules/report/reports_provider.dart';
import 'package:smuzy/modules/report/widgets/report_tile.dart';
import 'package:styled_widget/styled_widget.dart';

class ReportScreen extends HookConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var routinesReports = ref.watch(reportsProvider).routinesReports;

    return Scaffold(
      appBar: const DayAppBar(),
      body: DayChangeOnSwipe(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: routinesReports.any((element) => element.diffCount > 0)
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: CupertinoFormSection.insetGrouped(
                        backgroundColor: context.colorScheme.background,
                        children: routinesReports
                            .map(
                              (r) => CupertinoFormRow(
                                child: ReportTile(
                                  routineReport: r,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'There are no activities \n in this day',
                          textAlign: TextAlign.center,
                          style: context.theme.textTheme.headlineSmall
                              ?.copyWith(color: context.colorScheme.primary),
                        ).opacity(0.5),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
