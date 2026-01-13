class ApiEndpoints {
  static const baseUrl = 'http://10.0.2.2:3000';
  static const baseUrlProduction = 'https://atlasmart-backend.onrender.com';

  static const login = "/api/auth/login";
  static const sendOtpForPaswwordReset = "/api/auth/forgot-password";
  static const sendEmailVerificationOtp = '/api/auth/send-verification-otp';
  static const setPassword = "/api/auth/reset-password";
  static const verifyOtpForPasswordReset = "/api/auth/verify-otp";
  static const verifyEmailOtp = '/api/auth/verify-email';
  //registration
  static const customerRegister = "/api/auth/register";
  //profile
  static const customerProfile = '/api/customers/profile';

  //admin
  static const getAllUsers = '/api/admins/users';
}
