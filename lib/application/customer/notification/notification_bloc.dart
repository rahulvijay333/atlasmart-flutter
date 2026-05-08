import 'package:atlasmart/domain/customer/notifications/model/notification_model.dart';
import 'package:atlasmart/domain/customer/notifications/notification_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationService notificationService;

  NotificationBloc(this.notificationService)
    : super(NotificationState.initial()) {
    on<GetAllNotificationsEvent>((event, emit) async {
      emit(state.copyWith(isloading: true, error: null));

      try {
        final list = await notificationService.getAllNotifications();

        emit(state.copyWith(isloading: false, notificationList: list));
      } catch (e) {
        emit(state.copyWith(isloading: false, error: e.toString()));
      }
    });
  }
}
