import 'package:dartz/dartz.dart';
import 'package:unitip/exceptions/failure.dart';
import 'package:unitip/shared/data/models/authenticated_user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticatedUser>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<void> saveSession({
    required AuthenticatedUser authenticatedUser,
  });

  Future<Either<Failure, AuthenticatedUser>> getSession();
}
