part of 'customer_register_bloc.dart';

@freezed
class CustomerRegisterEvent with _$CustomerRegisterEvent {
  const factory CustomerRegisterEvent.initial() = _initial;

  const factory CustomerRegisterEvent.createAccount({
    required CustomerRegisterModel customer,
  }) = _CreateAccount;
}
