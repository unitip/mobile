import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      bottomNavigationBuilder: (context, tabsRouter) => NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.dashboard_rounded),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.cases_rounded),
            label: 'Jobs',
          ),
          NavigationDestination(
            icon: Icon(Icons.hail_rounded),
            label: 'Offers',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_rounded),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
