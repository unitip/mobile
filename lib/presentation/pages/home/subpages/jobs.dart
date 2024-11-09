import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/presentation/stores/counter.dart';

@RoutePage()
class HomeJobsScreen extends HookConsumerWidget {
  const HomeJobsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
      ),
      body: Center(
        child: Text(
          'Counter value: $counter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
