import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/routing/router.gr.dart';
import 'package:unitip/shared/providers/authentication.dart';

class ListOptions extends ConsumerWidget {
  const ListOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text('Keluar'),
          leading: Icon(Icons.logout_rounded),
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Keluar'),
              content: Text(
                'Apakah anda yakin ingin keluar dari akun Unitip?',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Batal'),
                ),
                TextButton(
                  onPressed: () => ref
                      .read(authenticationProvider.notifier)
                      .logout()
                      .then((_) {
                    if (context.mounted) {
                      context.router.popAndPush(HomeRoute());
                    }
                  }),
                  child: Text('Keluar'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
