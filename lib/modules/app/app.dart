import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy/modules/app/navigation.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

class _AppState extends State<App> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var defaultTransition = PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: NoAnimationPageTransitionsBuilder(),
        TargetPlatform.android: NoAnimationPageTransitionsBuilder(),
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
