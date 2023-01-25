import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:smuzy_flutter/modules/app/navigation.dart';

class TabNavigationScaffold extends HookConsumerWidget {
  const TabNavigationScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentIndex = useState(
      Navigation.tabs.indexWhere(
        (element) => element.link == GoRouter.of(context).location,
      ),
    );

    return Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).backgroundColor,
        child: SalomonBottomBar(
          currentIndex: currentIndex.value,
          onTap: (i) {
            currentIndex.value = i;
            context.go(Navigation.tabs[i].link);
          },
          itemPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          items: Navigation.tabs.map((e) => e.item).toList(),
        ),
      ),
      body: child,
    );
  }
}
