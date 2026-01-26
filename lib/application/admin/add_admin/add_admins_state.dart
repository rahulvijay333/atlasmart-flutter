part of 'add_admins_bloc.dart';

@freezed
class AddAdminsState with _$AddAdminsState {
  const factory AddAdminsState.initial() = _Initial;
  const factory AddAdminsState.loading() = _loading;
  const factory AddAdminsState.success() = _success;
  const factory AddAdminsState.failure(String message) = _failure;
}
