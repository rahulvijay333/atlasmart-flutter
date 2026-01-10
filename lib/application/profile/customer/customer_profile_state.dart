part of 'customer_profile_bloc.dart';

@freezed
class CustomerProfileState with _$CustomerProfileState {
  const factory CustomerProfileState.initial() = _Initial;
  const factory CustomerProfileState.loading() = _Loading;
  const factory CustomerProfileState.updateLoading() = _updateLoading;
  
  const factory CustomerProfileState.success({required ProfileModel profile}) = _Success;

  const factory CustomerProfileState.failed({required String message}) =
      _Failed;
}
