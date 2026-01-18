import 'package:atlasmart/domain/admin/profile/admin_profile_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/admin/profile/model/admin_profile.dart';

part 'admin_profile_event.dart';
part 'admin_profile_state.dart';
part 'admin_profile_bloc.freezed.dart';

class AdminProfileBloc extends Bloc<AdminProfileEvent, AdminProfileState> {

  final AdminProfileService _profileService;

  AdminProfileBloc(this._profileService) : super(_Initial()) {
    on<AdminProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
