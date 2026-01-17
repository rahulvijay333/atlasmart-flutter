part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.notverified({required UserDetails user}) =
      _notverified;
  const factory LoginState.verifyOtpSentLoading() = _verifyOtpSentLoading;

  const factory LoginState.verifyOtpSentSuccess({required String email}) =
      _verifyOtpSentSuccess;
  const factory LoginState.verifyOtpSendFailed(String message) =
      _verifyOtpSendFailed;

  const factory LoginState.verifyingAccount() = _verifyingAccount;

  const factory LoginState.success(AuthTokens tokens) = _Success;
  const factory LoginState.failure(String message) = _Failure;
}
