import 'package:atlasmart/domain/admin/manage_notification/manage_notification_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manage_admin_notification_event.dart';
part 'manage_admin_notification_state.dart';

class ManageAdminNotificationBloc
    extends Bloc<ManageAdminNotificationEvent, ManageAdminNotificationState> {
  final ManageNotificationService manageNotificationService;

  ManageAdminNotificationBloc(this.manageNotificationService)
    : super(ManageAdminNotificationState.initial()) {
    on<SendPushNotificationEvent>((event, emit) async {
      emit(state.copyWith(isloading: true, error: null));

      try {
        final status = await manageNotificationService.sendPromotionMessage(
          event.title,
          event.body,
        );

        if (status == true) {
          emit(state.copyWith(isloading: false, status: true));
        } else {
          emit(state.copyWith(isloading: false, status: false));
        }
      } catch (e) {
        emit(state.copyWith(isloading: false, error: e.toString()));
      }
    });
  }
}
