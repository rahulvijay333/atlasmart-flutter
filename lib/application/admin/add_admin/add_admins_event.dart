part of 'add_admins_bloc.dart';

@freezed
class AddAdminsEvent with _$AddAdminsEvent {
  const factory AddAdminsEvent.started() = _Started;
  const factory AddAdminsEvent.addNewAdmin(AdminUserModel newAdmin) =
      _AddNewAdmin;



}
