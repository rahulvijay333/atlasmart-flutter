part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginButtonClickEvent({
    required String email,
    required String password,
  }) = _LoginButtonClickEvent;

  const factory LoginEvent.sendOtpButtonClick({required String email}) =
      _sendOtpButtonClick;

  const factory LoginEvent.verifyAccountButtonClick({
    required String email,
    required String otp,
  }) = _verifyAccountButtonClick;

  const factory LoginEvent.logOutButtonClick() = _LogOutButtonClick;
}
