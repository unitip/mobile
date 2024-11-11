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
  }) async {}

  Future<void> logout() async {}

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {}
}
