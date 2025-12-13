import 'model/auth_token.dart';

abstract class AuthRepository {
  Future<AuthTokens> login(String email, String password);
  Future<AuthTokens> refresh(String refreshToken);
  Future<void> logout();
}