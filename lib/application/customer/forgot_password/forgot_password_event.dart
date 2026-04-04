part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.started() = _Started;
  const factory ForgotPasswordEvent.reset() = _reset;

  const factory ForgotPasswordEvent.sentEmailOtp({required String email}) =
      _sentEmailOtp;
  const factory ForgotPasswordEvent.verifyOtpButtonClick({
    required String email,
    required String otp,
  }) = _verifyOtpButtonClick;

  const factory ForgotPasswordEvent.setPasswordButtonClick({
    required String email,
    required String otp,
    required String password,
  }) = _setPasswordButtonClick;
}
