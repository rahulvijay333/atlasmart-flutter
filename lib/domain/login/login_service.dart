import '../../infrastructure/login/model/user_details/user_details.dart';
import '../auth/model/auth_token.dart';

abstract class LoginService {
  Future<(AuthTokens, UserDetails)> login(
    String email,
    String password,
    String? fcToken,
  );

  Future<bool> logout(String? fcToken);
  Future<bool> sendEmailOtp({required String email});
  Future<bool> sendEmailOtpForPasswordReset({required String email});

  Future<(bool, AuthTokens?)> verifyOtp({
    required String email,
    required String otp,
    bool isSaveConfigrequired,
  });
  Future<(bool, AuthTokens?)> verifyOtpForPasswordReset({
    required String email,
    required String otp,
  });

  Future<bool> setPassword({
    required String email,
    required String otp,
    required String password,
  });
}
