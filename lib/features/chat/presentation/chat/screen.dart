import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/utils/theme.dart';

@RoutePage()
class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nama Orang'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // chats
            Expanded(
              flex: 1,
              child: Container(
                child: Text('hello world'),
              ),
            ),

            // input message
            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                border: Border(
                  top: BorderSide(
                    color: context.colorScheme.onSurface.withOpacity(.32),
                  ),
                ),
              ),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Masukkan pesan...',
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () => {},
                    child: Icon(Icons.send_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
