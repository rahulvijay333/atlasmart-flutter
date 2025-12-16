import 'package:atlasmart/domain/auth/model/auth_token.dart';
import 'package:atlasmart/domain/login/login_service.dart';
import 'package:atlasmart/domain/token/token_storage.dart';
import 'package:dio/dio.dart';

import '../../domain/core/network/dio_error_handle.dart';

class LoginServiceImpl implements LoginService {
  final Dio dio;
  final TokenStorage storage;

  LoginServiceImpl({required this.dio, required this.storage});

  @override
  Future<AuthTokens> login(String email, String password) async {
    try {
      final res = await dio.post(
        "/api/auth/login",
        data: {"email": email, "password": password},
      );

      final tokens = AuthTokens(
        res.data['Data']["accessToken"],
        res.data["refresh_token"] ?? '',
        res.data["Data"]["user"]["role"],
      );

      // ✅ SAVE TOKENS HERE
      await storage.saveTokens(
        tokens.accessToken,
        tokens.refreshToken,
        tokens.role,
      );

      return tokens;
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<void> logout() async {
    await storage.clear();
  }
}
