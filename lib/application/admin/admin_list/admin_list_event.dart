part of 'admin_list_bloc.dart';

@freezed
class AdminListEvent with _$AdminListEvent {
  const factory AdminListEvent.started() = _Started;
  const factory AdminListEvent.getAllAdminList() = _GetAllAdminList;
  
  
  
  
}