import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smuzy/modules/app/widgets/tab_navigation_scaffold.dart';
import 'package:smuzy/modules/days/screens/day_screen.dart';
import 'package:smuzy/modules/report/screens/report_screen.dart';
import 'package:smuzy/modules/settings/settings_screen.dart';

class Routes {
  final home = TabRoute(
    link: '/',
    screen: const DayScreen(),
    item: SalomonBottomBarItem(
      icon: const Icon(Ionicons.calendar),
      title: const Text("Home"),
    ),
  );
  final reports = TabRoute(
    link: '/reports',
    screen: const ReportScreen(),
    item: SalomonBottomBarItem(
      icon: const Icon(Ionicons.pie_chart),
      title: const Text("Reports"),
    ),
  );
  final settings = TabRoute(
    link: '/settings',
    screen: const SettingsScreen(),
    item: SalomonBottomBarItem(
      icon: const Icon(Ionicons.settings_sharp),
      title: const Text("Settings"),
    ),
  );

  List<TabRoute> get tabs => [home, reports, settings];
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
      ),
    ],
  );

  static void openModal({
    required BuildContext context,
    required Widget child,
  }) {
    CupertinoScaffold.showCupertinoModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) => child,
      duration: const Duration(milliseconds: 350),
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
