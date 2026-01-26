part of 'all_users_bloc.dart';

@freezed
class AllUsersEvent with _$AllUsersEvent {
  const factory AllUsersEvent.started() = _Started;
  const factory AllUsersEvent.getAllUsers() = _GetAllUsers;
  const factory AllUsersEvent.searchUsers({required String keyword}) =
      _searchUsers;

  const factory AllUsersEvent.deleteUser(int id) = _DeleteUser;
}
