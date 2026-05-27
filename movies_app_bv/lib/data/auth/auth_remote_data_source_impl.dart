import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app_bv/domain/auth/datasources/auth_remote_data_source.dart';
import 'package:movies_app_bv/domain/auth/entities/auth_response.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  static const String _baseUrl = 'https://example.com/api';

  @override
  Future<AuthResponse> login({required String email, required String password}) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return AuthResponse.fromJson(data);
    }

    throw AuthException._fromResponse(response);
  }

  @override
  Future<AuthResponse> register({required String name, required String email, required String password}) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return AuthResponse.fromJson(data);
    }

    throw AuthException._fromResponse(response);
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  factory AuthException._fromResponse(http.Response response) {
    String message = 'Error de autenticación: ${response.statusCode}';
    try {
      final body = jsonDecode(response.body);
      if (body is Map<String, dynamic> && body['message'] != null) {
        message = body['message'] as String;
      }
    } catch (_) {
      // ignore
    }
    return AuthException(message);
  }

  @override
  String toString() => message;
}
