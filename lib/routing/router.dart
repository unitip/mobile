import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unitip/routing/guards/auth.dart';
import 'package:unitip/routing/router.gr.dart';
import 'package:unitip/utils/dependency_injection.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final WidgetRef ref;

  AppRouter({
    required this.ref,
  });

  @override
  List<AutoRoute> get routes => [
        // authentication
        AutoRoute(
          page: AuthRoute.page,
        ),

        // home
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
            AutoRoute(page: DashboardRoute.page),
            AutoRoute(page: JobRoute.page),
            AutoRoute(page: OfferRoute.page),
            AutoRoute(page: ListChatRoute.page),
            AutoRoute(page: SettingRoute.page),
          ],
        ),

        // chat
        AutoRoute(
          page: ChatRoute.page,
          guards: [
            AuthGuard(
              authenticationRepository:
                  ref.read(authenticationRepositoryProvider),
            )
          ],
        ),
      ];
}
