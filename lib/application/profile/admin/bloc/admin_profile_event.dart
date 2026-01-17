part of 'admin_profile_bloc.dart';

@freezed
class AdminProfileEvent with _$AdminProfileEvent {
  const factory AdminProfileEvent.started() = _Started;

  const factory AdminProfileEvent.getProfileDetails() = _GetProfileDetails;

  const factory AdminProfileEvent.updateProfileDetailsButtonClick({
    required AdminUserModel profile,
  }) = _UpdateProfileDetailsButtonClick;
}
