part of 'customer_profile_bloc.dart';

@freezed
class CustomerProfileEvent with _$CustomerProfileEvent {
  const factory CustomerProfileEvent.started() = _Started;

  const factory CustomerProfileEvent.getProfileDetails() = _GetProfileDetails;

  const factory CustomerProfileEvent.updateProfileDetailsButtonClick({
    required ProfileModel profile,
  }) = _UpdateProfileDetailsButtonClick;
}
