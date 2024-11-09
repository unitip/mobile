import 'package:auto_route/auto_route.dart';
import 'package:unitip/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          // initial: true,
          children: [
            AutoRoute(page: HomeDashboardRoute.page),
            AutoRoute(page: HomeJobsRoute.page),
            AutoRoute(page: HomeOffersRoute.page),
            AutoRoute(page: HomeSettingsRoute.page),
          ],
        ),
      ];
}
