import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:get/get.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/modules/app/app_conroller.dart';
import 'package:smuzy_flutter/modules/days/day_screen.dart';

part 'app.g.dart';

@hwidget
Widget app() {
  useEffect(() {
    Get.put(AppController());
    return null;
  }, const []);

  return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme:
              const AppBarTheme(color: AppColors.grayDark, elevation: 1),
          scaffoldBackgroundColor: Colors.black),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const DayScreen()),
      ]);
}
