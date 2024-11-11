import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/shared/providers/authentication.dart';
import 'package:unitip/utils/theme.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authentication = ref.watch(authenticationProvider);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(
        children: [
          // profile picture
          CircleAvatar(
            radius: 24,
            child: Icon(Icons.person_rounded),
          ),
          SizedBox(width: 16),

          // user details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authentication.value?.name ?? 'Tidak ada nama',
                  style: context.textTheme.titleMedium,
                ),
                Text(
                  authentication.value?.email ?? 'Tidak ada email',
                  style: context.textTheme.bodySmall,
                ),
                Text(
                  'ID: ${authentication.value?.id ?? 'tidak ada id'}',
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
