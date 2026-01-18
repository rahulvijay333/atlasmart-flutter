part of 'admin_profile_bloc.dart';

@freezed
class AdminProfileState with _$AdminProfileState {
  const factory AdminProfileState.initial() = _Initial;
  const factory AdminProfileState.loading() = _Loading;
  const factory AdminProfileState.updateLoading() = _updateLoading;

  const factory AdminProfileState.success({required AdminUserModel profile}) =
      _Success;

  const factory AdminProfileState.failed({required String message}) = _Failed;
}
