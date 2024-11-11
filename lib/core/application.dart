import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/core/router/router.dart';

AppRouter? _appRouter;

class UnitipApplication extends ConsumerWidget {
  const UnitipApplication({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _appRouter ??= AppRouter(ref: ref);

    return MaterialApp.router(
      routerConfig: _appRouter?.config(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
