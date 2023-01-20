import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/common/theme/colors.dart';
import 'package:smuzy_flutter/modules/app/router.dart';

part 'app.g.dart';

@swidget
Widget app() {
  return ProviderScope(
      child: MaterialApp.router(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: AppColors.grayDark, elevation: 1),
        scaffoldBackgroundColor: Colors.black),
    routerConfig: router,
  ));
}
