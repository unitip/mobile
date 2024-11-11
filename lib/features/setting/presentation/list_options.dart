import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
          onTap: () => {},
        ),
      ],
    );
  }
}
