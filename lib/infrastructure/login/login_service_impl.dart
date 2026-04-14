import 'dart:convert';
import 'dart:developer';

import 'package:atlasmart/domain/auth/model/auth_token.dart';
import 'package:atlasmart/domain/endpoints/api_endpoints.dart';
import 'package:atlasmart/domain/login/login_service.dart';
import 'package:atlasmart/domain/token/token_storage.dart';
import 'package:atlasmart/infrastructure/login/model/user_details/user_details.dart';
import 'package:dio/dio.dart';

import '../../domain/core/network/dio_error_handle.dart';

class LoginServiceImpl implements LoginService {
  final Dio dio;
  final TokenStorage storage;

  LoginServiceImpl({required this.dio, required this.storage});

  @override
  Future<(AuthTokens, UserDetails)> login(
    String email,
    String password,
    String? fcToken,
  ) async {
    try {
      final res = await dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,

          if (fcToken != null && fcToken.isNotEmpty) "fcmToken": fcToken,
        },
      );

      final data = UserDetails.fromJson(jsonEncode(res.data));
      final tokens = AuthTokens(
        res.data['Data']["accessToken"],
        res.data['Data']["refreshToken"],
        res.data["Data"]["user"]["role"],
      );
      if (data.data?.user?.isVerified == true) {
        await storage.saveTokens(
          tokens.accessToken,
          tokens.refreshToken,
          tokens.role,
        );
      }

      return (tokens, data);
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<bool> logout(String? fcToken) async {
    try {
      final refreshToken = await storage.getRefreshToken();

      final res = await dio.post(
        ApiEndpoints.logOut,
        data: {
          "refreshToken": refreshToken,

          if (fcToken != null && fcToken.isNotEmpty) "fcmToken": fcToken,
        },
      );

      if (res.statusCode == 200) {
        await storage.clear();
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<bool> sendEmailOtp({required String email}) async {
    try {
      final res = await dio.post(
        ApiEndpoints.sendEmailVerificationOtp,
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
  Future<(bool, AuthTokens?)> verifyOtp({
    required String email,
    required String otp,
    bool isSaveConfigrequired = false,
  }) async {
    try {
      final res = await dio.post(
        ApiEndpoints.verifyEmailOtp,
        data: {"email": email, "otp": otp},
      );
      final tokens = AuthTokens(
        res.data['Data']["accessToken"],
        res.data['Data']["refreshToken"],
        res.data["Data"]["user"]["role"],
      );

      if (res.statusCode == 200) {
        if (isSaveConfigrequired == true) {
          await storage.saveTokens(
            tokens.accessToken,
            tokens.refreshToken,
            tokens.role,
          );
        }

        return (true, tokens);
      } else {
        return (false, null);
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<bool> sendEmailOtpForPasswordReset({required String email}) async {
    try {
      final res = await dio.post(
        ApiEndpoints.sendOtpForPaswwordReset,
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
  Future<(bool, AuthTokens?)> verifyOtpForPasswordReset({
    required String email,
    required String otp,
  }) async {
    try {
      final res = await dio.post(
        ApiEndpoints.verifyOtpForPasswordReset,
        data: {"email": email, "otp": otp},
      );
      final tokens = AuthTokens(
        res.data['Data']["accessToken"],
        res.data['Data']["refreshToken"],
        res.data["Data"]["user"]["role"],
      );

      if (res.statusCode == 200) {
        return (true, tokens);
      } else {
        return (false, null);
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
