import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/core/providers/provider.dart';
import 'package:unitip/presentation/stores/counter.dart';

@RoutePage()
class HomeDashboardScreen extends HookConsumerWidget {
  const HomeDashboardScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloWorld = ref.read(helloWorldProvider);
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, $helloWorld'),
            Text('Counter value: $counter'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () =>
                      ref.read(counterProvider.notifier).increment(),
                  child: Text('Increment'),
                ),
                FilledButton(
                  onPressed: () =>
                      ref.read(counterProvider.notifier).decrement(),
                  child: Text('Decrement'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
