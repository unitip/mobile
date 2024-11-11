import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unitip/constants/url.dart';
import 'package:unitip/exceptions/failure.dart';
import 'package:unitip/shared/data/models/authenticated_user.dart';
import 'package:unitip/shared/domain/repositories/authentication.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final _baseUrl = '${ConstantURL.apiBaseUrl}/auth';
  final _authenticatedUserKey = 'authenticated_user';
  final _preferencesAsync = SharedPreferencesAsync();

  @override
  Future<Either<Failure, AuthenticatedUser>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode != 200) {
        return Left(Failure(message: response.body));
      }

      return Right(
        AuthenticatedUser.fromJson(
          jsonDecode(response.body),
        ),
      );
    } catch (_) {
      return Left(
        Failure(message: 'Terjadi kesalahan tak terduga!'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> register({
    required String name,
    required String email,
    required String password,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthenticatedUser>> getSession() async {
    final session = await _preferencesAsync.getString(_authenticatedUserKey);

    if (session == null) {
      return Left(Failure(message: 'Sesi tidak ditemukan!'));
    }

    return Right(AuthenticatedUser.fromJson(
      jsonDecode(session),
    ));
  }

  @override
  Future<void> logout() => _preferencesAsync.remove(_authenticatedUserKey);

  @override
  Future<void> saveSession({
    required AuthenticatedUser authenticatedUser,
  }) =>
      _preferencesAsync.setString(
        _authenticatedUserKey,
        jsonEncode(authenticatedUser.toJson()),
      );
}
