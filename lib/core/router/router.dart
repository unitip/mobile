import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/core/di/index.dart';
import 'package:unitip/core/router/guards/auth.dart';
import 'package:unitip/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final WidgetRef ref;

  AppRouter({
    required this.ref,
  });

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          guards: [
            AuthGuard(
              authenticationRepository:
                  ref.read(authenticationRepositoryProvider),
            )
          ],
          children: [
            AutoRoute(page: HomeDashboardRoute.page),
            AutoRoute(page: HomeJobsRoute.page),
            AutoRoute(page: HomeOffersRoute.page),
            AutoRoute(page: HomeChatsRoute.page),
            AutoRoute(page: HomeSettingsRoute.page),
          ],
        ),
      ];
}
