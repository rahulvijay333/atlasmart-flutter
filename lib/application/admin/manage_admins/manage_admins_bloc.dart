import 'package:atlasmart/domain/admin/manage_admins/manage_admin_service.dart';
import 'package:atlasmart/domain/admin/profile/model/admin_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_admins_event.dart';
part 'manage_admins_state.dart';
part 'manage_admins_bloc.freezed.dart';

class ManageAdminsBloc extends Bloc<ManageAdminsEvent, ManageAdminsState> {
  final ManageAdminService manageAdminService;

  ManageAdminsBloc(this.manageAdminService) : super(_Initial()) {
    on<_AddNewAdmin>((event, emit) async {
      emit(_loading());

      try {
        final addStatus = await manageAdminService.addNewAdmin(event.newAdmin);

        if (addStatus == true) {
          emit(_success());
        } else {
          emit(_failure('Admin creation failed'));
        }
      } catch (e) {
        emit(_failure(e.toString()));
      }
    });
  }
}
