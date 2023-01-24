import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smuzy_flutter/common/widgets/tab_navigation_scaffold.dart';
import 'package:smuzy_flutter/modules/days/screens/day_screen.dart';
import 'package:smuzy_flutter/modules/settings/settings_screen.dart';

class Routes {
  final home = const Route(link: '/', screen: DayScreen());
  final settings = const Route(link: '/settings', screen: SettingsScreen());
}

class Navigation {
  static Routes routes = Routes();

  static final tabs = [
    Tab(
      link: routes.home.link,
      item: SalomonBottomBarItem(
        icon: const Icon(Ionicons.calendar),
        title: const Text("Home"),
      ),
    ),
    Tab(
      link: routes.settings.link,
      item: SalomonBottomBarItem(
        icon: const Icon(Ionicons.settings_sharp),
        title: const Text("Settings"),
      ),
    ),
  ];

  static var router = GoRouter(
    initialLocation: routes.home.link,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return TabNavigationScaffold(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: routes.home.link,
            builder: (context, state) => routes.home.screen,
          ),
          GoRoute(
            path: routes.settings.link,
            builder: (context, state) => routes.settings.screen,
          ),
        ],
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
}

class Route {
  final String link;
  final Widget screen;

  const Route({
    required this.link,
    required this.screen,
  });
}

class Tab {
  final String link;
  final SalomonBottomBarItem item;

  const Tab({
    required this.link,
    required this.item,
  });
}
