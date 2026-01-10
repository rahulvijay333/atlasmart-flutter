import 'package:atlasmart/domain/auth/model/auth_token.dart';
import 'package:atlasmart/domain/endpoints/api_endpoints.dart';
import 'package:atlasmart/domain/token/token_service.dart';
import 'package:dio/dio.dart';

import '../../domain/token/token_storage.dart';

class TokenServiceImpl implements TokenService {
  final TokenStorage storage;

  TokenServiceImpl({required this.storage});
  @override
  Future<void> refresh(String refreshToken) async {
    final res = await Dio().post(
      "${ApiEndpoints.baseUrl}/api/auth/refresh",
      data: {"refreshToken": refreshToken},
    );

    await storage.updateAccessToken(res.data['Data']["accessToken"]);
  }
}
