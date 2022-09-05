import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smuzy_flutter/modules/main/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smuzy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Color(0xff121212)),
          scaffoldBackgroundColor: Colors.black),
      home: HomeScreen(),
    );
  }
}
