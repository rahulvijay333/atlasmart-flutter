part of 'manage_admin_notification_bloc.dart';

class ManageAdminNotificationState {
  final bool isloading;
  final bool status;
  String? error;

  ManageAdminNotificationState({
    required this.isloading,
    required this.status,
    this.error,
  });

  ManageAdminNotificationState copyWith({
    bool? isloading,
    bool? status,
    String? error,
  }) {
    return ManageAdminNotificationState(
      isloading: isloading ?? this.isloading,
      status: status ?? this.status,
      error: error,
    );
  }

  factory ManageAdminNotificationState.initial() {
    return ManageAdminNotificationState(isloading: false, status: false);
  }
}
