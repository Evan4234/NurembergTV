import 'package:flutter/foundation.dart';

class AuthResponse {
  final String token;
  final String userId;
  final String email;
  final String name;

  AuthResponse({
    required this.token,
    required this.userId,
    required this.email,
    required this.name,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'] as String? ?? '',
      userId: json['userId'] as String? ?? json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }
}
