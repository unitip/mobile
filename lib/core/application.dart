import 'package:flutter/material.dart';
import 'package:unitip/core/router/router.dart';

class UnitipApplication extends StatelessWidget {
  UnitipApplication({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
