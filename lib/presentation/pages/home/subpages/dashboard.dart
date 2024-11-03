import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/core/providers/provider.dart';

@RoutePage()
class HomeDashboardScreen extends HookConsumerWidget {
  const HomeDashboardScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloWorld = ref.read(helloWorldProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Text('Hello, $helloWorld'),
        ],
      ),
    );
  }
}
