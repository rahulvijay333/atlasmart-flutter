import 'package:atlasmart/domain/admin/users/model/user_model.dart';
import 'package:atlasmart/domain/admin/users/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_users_event.dart';
part 'all_users_state.dart';
part 'all_users_bloc.freezed.dart';

//admin side feature

class AllUsersBloc extends Bloc<AllUsersEvent, AllUsersState> {
  final UserService _userService;

  AllUsersBloc(this._userService) : super(_Initial()) {
    on<_GetAllUsers>((event, emit) async {
      emit(_loading());

      try {
        final users = await _userService.getAllUsers();
        emit(_success(users: users));
      } catch (e) {
        emit(_failure(e.toString()));
      }
    });

    on<_DeleteUser>((event, emit) async {
      emit(_loading());

      try {
        final status = await _userService.deleteUser(event.id);
        if (status == true) {
          add(_GetAllUsers());
        } else {
          emit(_failure('Not able to delete, Try after some time'));
        }
      } catch (e) {
        emit(_failure(e.toString()));
      }
    });
  }
}
