import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unitip/shared/data/models/authenticated_user.dart';
import 'package:unitip/utils/dependency_injection.dart';

part 'authentication.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  Future<AuthenticatedUser?> build() async {
    // memuat sesi user yang sedang login
    final repository = ref.read(authenticationRepositoryProvider);
    final session = await repository.getSession();

    return session.fold(
      (l) => null,
      (r) => r,
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = AsyncLoading();

    final repository = ref.read(authenticationRepositoryProvider);
    (await repository.login(
      email: email,
      password: password,
    ))
        .fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) async {
        // save session to local storage
        (await repository.saveSession(authenticatedUser: r));

        // update state
        state = AsyncData(r);
      },
    );
  }

  Future<void> logout() async {
    final repository = ref.read(authenticationRepositoryProvider);
    await repository.logout();

    ref.invalidateSelf();
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {}
}
