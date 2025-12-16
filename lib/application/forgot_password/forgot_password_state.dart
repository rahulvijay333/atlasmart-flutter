part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = _loading;
  const factory ForgotPasswordState.verifyOtp() = _verifyOtp;
  const factory ForgotPasswordState.verifyOtpLoading() = _verifyOtpLoading;
  const factory ForgotPasswordState.setPassword() = _setPassword;
  const factory ForgotPasswordState.setPasswordLoading() = _setPasswordLoading;

  const factory ForgotPasswordState.success() = _success;
  const factory ForgotPasswordState.failure({required String message}) =
      _failure;
}
