import 'package:atlasmart/domain/auth/model/auth_token.dart';
import 'package:atlasmart/domain/endpoints/api_endpoints.dart';
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
        ApiEndpoints.login,
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

  @override
  Future<bool> sendEmailOtp({required String email}) async {
    try {
      final res = await dio.post(
        ApiEndpoints.forgotPassword,
        data: {"email": email},
      );

      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<bool> setPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    try {
      final res = await dio.post(
        ApiEndpoints.setPassword,
        data: {"email": email, "newPassword": password, "otp": otp},
      );

      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<bool> verifyOtp({required String email, required String otp}) async {
    try {
      final res = await dio.post(
        ApiEndpoints.verifyOtp,
        data: {"email": email, "otp": otp},
      );

      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}
