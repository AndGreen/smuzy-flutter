import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/modules/app/navigation.dart';

class TabNavigationScaffold extends HookConsumerWidget {
  const TabNavigationScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentIndex = useState(
      Navigation.routes.tabs.indexWhere(
        (element) => element.link == GoRouter.of(context).location,
      ),
    );

    return Scaffold(
      bottomNavigationBar: Container(
        color: context.colorScheme.background,
        child: SalomonBottomBar(
          currentIndex: currentIndex.value,
          onTap: (i) {
            currentIndex.value = i;
            context.go(Navigation.routes.tabs[i].link);
          },
          itemPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          items: Navigation.routes.tabs.map((e) => e.item).toList(),
        ),
      ),
      body: child,
    );
  }
}
