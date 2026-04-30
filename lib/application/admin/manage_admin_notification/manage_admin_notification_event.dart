part of 'manage_admin_notification_bloc.dart';

abstract class ManageAdminNotificationEvent {}

class SendPushNotificationEvent extends ManageAdminNotificationEvent {
  final String title;
  final String body;

  SendPushNotificationEvent({required this.title, required this.body});
}
