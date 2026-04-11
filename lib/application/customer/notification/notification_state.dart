part of 'notification_bloc.dart';

class NotificationState {
  final bool isloading;
  final List<NotificationModel> notificationList;
  String? error;

  NotificationState({
    required this.isloading,
    required this.notificationList,
    this.error,
  });

  factory NotificationState.initial() {
    return NotificationState(isloading: false, notificationList: []);
  }

  NotificationState copyWith({
    bool? isloading,
    List<NotificationModel>? notificationList,
    String? error,
  }) {
    return NotificationState(
      isloading: isloading ?? this.isloading,
      notificationList: notificationList ?? this.notificationList,
      error: error ,
    );
  }
}
