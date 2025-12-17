part of 'customer_register_bloc.dart';

@freezed
class CustomerRegisterState with _$CustomerRegisterState {
  const factory CustomerRegisterState.initial() = _Initial;
  const factory CustomerRegisterState.loading() = _loading;

  const factory CustomerRegisterState.verifyOtp({
   required CustomerRegisterModel customer
  }) = _verifyOtp;
  const factory CustomerRegisterState.verifyOtpLoading() = _verifyOtpLoading;

  const factory CustomerRegisterState.success() = _success;
  const factory CustomerRegisterState.failure({required String message}) =
      _failure;
}
