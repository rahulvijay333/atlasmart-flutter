import '../auth/model/auth_token.dart';

abstract class LoginService {
  Future<AuthTokens> login(String email, String password);

  Future<void> logout();
  Future<bool> sendEmailOtp({required String email});
  Future<bool> verifyOtp({required String email, required String otp});
  Future<bool> setPassword({
    required String email,
    required String otp,
    required String password,
  });
}





