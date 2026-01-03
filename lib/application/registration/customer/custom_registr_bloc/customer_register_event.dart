part of 'customer_register_bloc.dart';

@freezed
class CustomerRegisterEvent with _$CustomerRegisterEvent {
  const factory CustomerRegisterEvent.initial() = _initial;

  const factory CustomerRegisterEvent.createAccount({
    required CustomerRegisterModel customer,
  }) = _CreateAccount;

  const factory CustomerRegisterEvent.verifyOtpButtonClick({
    required CustomerRegisterModel customer,
  }) = _VerifyOtpButtonClick;

  const factory CustomerRegisterEvent.sendOtp({ required CustomerRegisterModel customer,required bool resendOtp}) =
      _SendOtp;
}
