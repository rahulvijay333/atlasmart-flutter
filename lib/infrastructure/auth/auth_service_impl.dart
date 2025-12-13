

import 'package:dio/dio.dart';

import '../../domain/auth/auth_service.dart';
import '../../domain/auth/model/auth_token.dart';
import '../../domain/token/token_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;
  final TokenStorage storage;

  AuthRepositoryImpl(this.dio, this.storage);

  @override
  Future<AuthTokens> login(String email, String password) async {
    final res = await dio.post("/auth/login", data: {
      "email": email,
      "password": password,
    });

    return AuthTokens(
      res.data["access_token"],
      res.data["refresh_token"],
    );
  }

  @override
  Future<AuthTokens> refresh(String refreshToken) async {
    final res = await dio.post("/auth/refresh", data: {
      "refresh_token": refreshToken
    });

    return AuthTokens(
      res.data["access_token"],
      res.data["refresh_token"],
    );
  }

  @override
  Future<void> logout() async {
    await storage.clear();
  }
}
