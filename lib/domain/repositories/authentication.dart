abstract class AuthenticationRepository {
  Future<bool> login({
    required String email,
    required String password,
  });

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  });
}
