import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/features/setting/presentation/list_options.dart';
import 'package:unitip/features/setting/presentation/user_profile.dart';

@RoutePage()
class SettingScreen extends HookConsumerWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setelan'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfile(),
            Divider(),
            ListOptions(),
          ],
        ),
      ),
    );
  }
}
