import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smuzy_flutter/modules/app/router.dart';

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
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.deepBlue,
          useMaterial3: true,
          fontFamily: 'Roboto',
          background: CupertinoColors.darkBackgroundGray,
        ),
        themeMode: ThemeMode.dark,
        routerConfig: router,
      ),
    );
  }
}
