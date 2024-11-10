import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unitip/core/providers/provider.dart';

part 'authentication.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  FutureOr<void> build() {}

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      state = AsyncLoading();

      final response = await ref
          .read(authenticationRepositoryProvider)
          .login(email: email, password: password);

      state = AsyncData(null);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return true;
  }
}
