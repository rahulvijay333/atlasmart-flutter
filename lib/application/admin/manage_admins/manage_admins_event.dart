part of 'manage_admins_bloc.dart';

@freezed
class ManageAdminsEvent with _$ManageAdminsEvent {
  const factory ManageAdminsEvent.started() = _Started;
  const factory ManageAdminsEvent.addNewAdmin(AdminUserModel newAdmin) =
      _AddNewAdmin;
}
