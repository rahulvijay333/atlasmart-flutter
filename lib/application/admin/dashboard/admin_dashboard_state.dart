part of 'admin_dashboard_bloc.dart';

class AdminDashboardState {
  final bool isloading;
  final AdminDashboardModel? dashboard;
  String? error;

  AdminDashboardState({
    required this.isloading,
    required this.dashboard,
    this.error,
  });

  factory AdminDashboardState.intial() {
    return AdminDashboardState(isloading: false, dashboard: null, error: null);
  }
  AdminDashboardState copyWith({
    bool? isloading,
    AdminDashboardModel? dashboard,
    String? error,
  }) {
    return AdminDashboardState(
      isloading: isloading ?? this.isloading,
      dashboard: dashboard ?? this.dashboard,
      error: error,
    );
  }
}
