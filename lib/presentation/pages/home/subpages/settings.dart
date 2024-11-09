import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomeSettingsScreen extends HookConsumerWidget {
  const HomeSettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('Keluar'),
            ),
          ],
        ),
      ),
    );
  }
}
