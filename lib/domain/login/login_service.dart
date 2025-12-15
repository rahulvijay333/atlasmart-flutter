import '../auth/model/auth_token.dart';

abstract class LoginService {
  Future<AuthTokens> login(String email, String password);

  Future<void> logout();
}
