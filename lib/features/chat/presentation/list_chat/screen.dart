import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/routing/router.gr.dart';

@RoutePage()
class ListChatScreen extends HookConsumerWidget {
  const ListChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Percakapan'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person_rounded),
            ),
            title: Text('Percakapan ${index + 1}'),
            subtitle: Text('${index % 2 == 0 ? 'Anda: ' : ''}Pesan terakhir'),
            trailing: Text('12:00'),
            onTap: () => context.router.push(ChatRoute()),
          );
        },
      ),
    );
  }
}
