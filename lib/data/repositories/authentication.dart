import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unitip/core/constants.dart';
import 'package:unitip/domain/repositories/authentication.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final String _baseUrl = '${Constants.apiBaseUrl}/auth';

  @override
  Future<bool> login({
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

      if (response.statusCode != 200) throw Exception(response.body);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
