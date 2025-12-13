import 'package:dio/dio.dart';
import '../../domain/token/token_storage.dart';
import 'auth_service_impl.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage storage;
  final AuthRepositoryImpl repository;

  bool refreshing = false;

  AuthInterceptor(this.storage, this.repository);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final access = await storage.getAccessToken();

    if (access != null) {
      if (storage.isExpired(access)) {
        await _refreshToken();
      }

      final newToken = await storage.getAccessToken();
      options.headers["Authorization"] = "Bearer $newToken";
    }

    handler.next(options);
  }

  Future<void> _refreshToken() async {
    if (refreshing) return;
    refreshing = true;

    try {
      final refresh = await storage.getRefreshToken();
      if (refresh != null) {
        final tokens = await repository.refresh(refresh);
        await storage.saveTokens(tokens.accessToken, tokens.refreshToken);
      }
    } catch (_) {
      await storage.clear();
    } finally {
      refreshing = false;
    }
  }
}
