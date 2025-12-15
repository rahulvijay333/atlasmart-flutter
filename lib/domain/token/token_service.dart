import '../auth/model/auth_token.dart';

abstract class TokenService {
  Future<AuthTokens> refresh(String refreshToken);
}
