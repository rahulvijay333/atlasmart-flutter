part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;

  const factory ForgotPasswordState.enterEmail() = _enterEmail;
  const factory ForgotPasswordState.sentEmailOtpLoading() =
      _sentEmailOtpLoading;
  const factory ForgotPasswordState.sentEmailOtpFailed(String message) =
      __sentEmailOtpFailed;

  const factory ForgotPasswordState.verifyOtp() = _verifyOtp;
  const factory ForgotPasswordState.verifyOtpLoading() = _verifyOtpLoading;
  const factory ForgotPasswordState.verifyOtpFailed(String message) =
      _verifyOtpFailed;

  const factory ForgotPasswordState.setPassword() = _setPassword;
  const factory ForgotPasswordState.setPasswordLoading() = _setPasswordLoading;

  const factory ForgotPasswordState.success() = _success;
  const factory ForgotPasswordState.setPasswordfailed({
    required String message,
  }) = _setPasswordfailed;
}
