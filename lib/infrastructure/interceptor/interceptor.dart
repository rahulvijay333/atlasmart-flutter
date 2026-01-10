import 'dart:developer';

import 'package:dio/dio.dart';

import '../../domain/token/token_service.dart';
import '../../domain/token/token_storage.dart';

class DioInterceptor extends QueuedInterceptor {
  final TokenStorage storage;
  final TokenService tokenService;

  DioInterceptor(this.storage, this.tokenService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final access = await storage.getAccessToken();

    if (access != null) {
      if (storage.isExpired(access)) {
        await _refreshToken();
      }

      final token = await storage.getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }

  Future<void> _refreshToken() async {
    final refresh = await storage.getRefreshToken();
    if (refresh == null) throw Exception('No refresh token');

    await tokenService.refresh(refresh);
  }
}

// class DioInterceptor extends Interceptor {
//   final TokenStorage storage;
//   final TokenService tokenService;

//   bool refreshing = false;

//   DioInterceptor(this.storage, this.tokenService);

//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     final access = await storage.getAccessToken();

//     if (access != null) {
//       if (storage.isExpired(access)) {
//         await _refreshToken();
//       }

//       final newToken = await storage.getAccessToken();
//       options.headers['Authorization'] = 'Bearer $newToken';
//     }

//     handler.next(options);
//   }

//   Future<void> _refreshToken() async {
//     if (refreshing) return;
//     refreshing = true;

//     try {
//       final refresh = await storage.getRefreshToken();
//       if (refresh != null) {
//         await tokenService.refresh(refresh);
//       }
//     } catch (e) {
//       log(e.toString());
//       // await storage.clear();
//     } finally {
//       refreshing = false;
//     }
//   }
// }
