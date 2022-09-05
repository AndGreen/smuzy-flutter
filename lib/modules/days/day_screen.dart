import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smuzy_flutter/common/theme/fonts.dart';
import 'package:smuzy_flutter/common/utils/dates.dart';
import 'package:smuzy_flutter/modules/app/app_conroller.dart';
import 'package:smuzy_flutter/modules/routines/routines_list.dart';

class DayScreen extends StatelessWidget {
  DayScreen({super.key}) {
    Get.put(AppController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getCurrentFormattedDay(), style: AppFonts.title),
      ),
      body: Column(
        children: const [RoutinesList()],
      ),
    );
  }
}
