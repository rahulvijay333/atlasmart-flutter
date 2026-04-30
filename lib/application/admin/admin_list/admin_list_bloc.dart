import 'package:atlasmart/domain/admin/profile/model/admin_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/admin/manage_admins/manage_admin_service.dart';

part 'admin_list_event.dart';
part 'admin_list_state.dart';
part 'admin_list_bloc.freezed.dart';

class AdminListBloc extends Bloc<AdminListEvent, AdminListState> {
  final ManageAdminService manageAdminService;
  AdminListBloc(this.manageAdminService) : super(_Initial()) {
    on<_GetAllAdminList>((event, emit) async {
      emit(_loading());

      try {
        final list = await manageAdminService.getAllAdmins();

        emit(_success(list));
      } catch (e) {
        emit(_failure(e.toString()));
      }
    });

    on<_DeleteAdmin>((event, emit) async {
      emit(_loading());

      try {
        final status = await manageAdminService.deleteAdmin(event.id);

        if (status == true) {
          add(_GetAllAdminList());
        } else {
          emit(_failure('Not able to delete, Try after some time'));
        }
      } catch (e) {
        emit(_failure(e.toString()));
      }
    });
  }
}
