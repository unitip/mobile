import 'package:auto_route/auto_route.dart';
import 'package:unitip/routing/router.gr.dart';
import 'package:unitip/shared/domain/repositories/authentication.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthenticationRepository authenticationRepository;

  const AuthGuard({
    required this.authenticationRepository,
  });

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final session = await authenticationRepository.getSession();

    session.fold(
      (l) => resolver.redirect(AuthRoute()),
      (r) => resolver.next(),
    );
  }
}
