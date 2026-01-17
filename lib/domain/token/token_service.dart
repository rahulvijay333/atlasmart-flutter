import '../auth/model/auth_token.dart';

abstract class TokenService {
  Future<void> refresh(String refreshToken);
}
