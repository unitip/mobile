import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unitip/core/router/router.gr.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeDashboardRoute(),
        HomeJobsRoute(),
        HomeOffersRoute(),
        HomeChatsRoute(),
        HomeSettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_rounded),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(Icons.cases_rounded),
              label: 'Jobs',
            ),
            NavigationDestination(
              icon: Icon(Icons.local_offer_rounded),
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
        );
      },
    );
  }
}
