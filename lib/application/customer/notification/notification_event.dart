part of 'notification_bloc.dart';

abstract class NotificationEvent {}

class GetAllNotificationsEvent extends NotificationEvent {
  GetAllNotificationsEvent();
}

class ClearAllNotificationsEvent extends NotificationEvent {
  ClearAllNotificationsEvent();
}
