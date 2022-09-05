import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/modules/days/day_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(color: AppColors.gray),
            scaffoldBackgroundColor: Colors.black),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => DayScreen()),
        ]);
  }
}
