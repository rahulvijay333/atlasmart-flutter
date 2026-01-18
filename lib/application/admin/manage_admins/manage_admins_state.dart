part of 'manage_admins_bloc.dart';

@freezed
class ManageAdminsState with _$ManageAdminsState {
  const factory ManageAdminsState.initial() = _Initial;
  const factory ManageAdminsState.loading() = _loading;
  const factory ManageAdminsState.success() = _success;
  const factory ManageAdminsState.failure(String message) = _failure;
}
