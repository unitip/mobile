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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Nama'),
            Text('Alamat email'),
            Text('user id'),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text('Keluar'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
