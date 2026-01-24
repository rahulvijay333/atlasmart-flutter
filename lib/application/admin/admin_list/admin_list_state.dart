part of 'admin_list_bloc.dart';

@freezed
class AdminListState with _$AdminListState {
  const factory AdminListState.initial() = _Initial;
  const factory AdminListState.loading() = _loading;
  const factory AdminListState.success(List<AdminUserModel>adminList) = _success;
  const factory AdminListState.failure(String message) = _failure;
  
  
  
}
