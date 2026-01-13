part of 'all_users_bloc.dart';

@freezed
class AllUsersState with _$AllUsersState {
  const factory AllUsersState.initial() = _Initial;
  const factory AllUsersState.loading() = _loading;
  const factory AllUsersState.success({required List<UserModel> users}) =
      _success;
  const factory AllUsersState.failure(String message) = _failure;
}
