import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navigationIndex = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unitip'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationIndex.value,
        onDestinationSelected: (value) => navigationIndex.value = value,
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
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
