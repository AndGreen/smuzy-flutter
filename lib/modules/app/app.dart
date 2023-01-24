import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/modules/app/navigation.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var defaultTransition = const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    );

    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: FlexThemeData.light(
          pageTransitionsTheme: defaultTransition,
          scheme: FlexScheme.deepBlue,
          useMaterial3: true,
        ),
        darkTheme: FlexThemeData.dark(
          pageTransitionsTheme: defaultTransition,
          scheme: FlexScheme.deepBlue,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        routerConfig: Navigation.router,
      ),
    );
  }
}
