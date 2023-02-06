import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smuzy/modules/app/widgets/tab_navigation_scaffold.dart';
import 'package:smuzy/modules/report/screens/report_screen.dart';
import 'package:smuzy/modules/days/screens/day_screen.dart';
import 'package:smuzy/modules/settings/settings_screen.dart';
import 'package:another_flushbar/flushbar.dart';

class Routes {
  final home = TabRoute(
    link: '/',
    screen: DayScreen(),
    item: SalomonBottomBarItem(
      icon: Icon(Ionicons.calendar),
      title: Text("Home"),
    ),
  );
  final reports = TabRoute(
    link: '/reports',
    screen: ReportScreen(),
    item: SalomonBottomBarItem(
      icon: Icon(Ionicons.pie_chart),
      title: Text("Reports"),
    ),
  );
  final settings = TabRoute(
    link: '/settings',
    screen: SettingsScreen(),
    item: SalomonBottomBarItem(
      icon: Icon(Ionicons.settings_sharp),
      title: Text("Settings"),
    ),
  );

  List<Route> get tabs => [home, reports, settings];
}

class Navigation {
  static Routes routes = Routes();

  static var router = GoRouter(
    initialLocation: routes.home.link,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return TabNavigationScaffold(
            child: child,
          );
        },
        routes: routes.tabs
            .map((e) => GoRoute(path: e.link, builder: (_, __) => e.screen))
            .toList(),
      )
    ],
  );

  static void openModal({
    required BuildContext context,
    required Widget child,
  }) {
    showCupertinoModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) => child,
    );
  }

  static void closeModal(BuildContext context) {
    Navigator.of(context).pop();
  }

  static showNotification({
    required BuildContext context,
    required String message,
    required bool isSuccess,
  }) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      message: message,
      duration: const Duration(seconds: 2),
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
    ).show(context);
  }
}

class Route {
  final String link;
  final Widget screen;

  const Route({
    required this.link,
    required this.screen,
  });
}

class TabRoute extends Route {
  final SalomonBottomBarItem item;

  const TabRoute({
    required super.link,
    required super.screen,
    required this.item,
  });
}
