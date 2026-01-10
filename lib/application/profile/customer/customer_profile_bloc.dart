import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/profile/model/profile_model.dart';
import '../../../domain/profile/profile_service.dart';

part 'customer_profile_event.dart';
part 'customer_profile_state.dart';
part 'customer_profile_bloc.freezed.dart';

class CustomerProfileBloc
    extends Bloc<CustomerProfileEvent, CustomerProfileState> {
  final ProfileService _profileService;
  CustomerProfileBloc(this._profileService) : super(_Initial()) {
    on<_GetProfileDetails>((event, emit) async {
      emit(_Loading());

      try {
        final resp = await _profileService.getProfileDetails();

        emit(_Success(profile: resp));
      } catch (e) {
        emit(_Failed(message: e.toString()));
      }
    });
  }
}
