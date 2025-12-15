import 'package:atlasmart/domain/auth/model/auth_token.dart';
import 'package:atlasmart/domain/token/token_service.dart';
import 'package:dio/dio.dart';

import '../../domain/token/token_storage.dart';

class TokenServiceImpl implements TokenService {
  final TokenStorage storage;

  TokenServiceImpl({required this.storage});
  @override
  Future<AuthTokens> refresh(String refreshToken) async {
    final res = await Dio().post(
      "/auth/refresh",
      data: {"refresh_token": refreshToken},
    );

    final tokens = AuthTokens(
      res.data["accessToken"],
      res.data["refresh_token"],
      res.data["user"]["role"],
    );

    // ✅ UPDATE TOKENS HERE
    await storage.saveTokens(tokens.accessToken, tokens.refreshToken,tokens.role);

    return tokens;
  }
}
