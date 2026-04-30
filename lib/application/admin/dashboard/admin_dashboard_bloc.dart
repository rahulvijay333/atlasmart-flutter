import 'package:atlasmart/domain/admin/dashboard/model/admin_dashboard_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/admin/dashboard/dashboard_service.dart';

part 'admin_dashboard_event.dart';
part 'admin_dashboard_state.dart';

class AdminDashboardBloc
    extends Bloc<AdminDashboardEvent, AdminDashboardState> {
  final DashboardService dashboardService;

  AdminDashboardBloc(this.dashboardService)
    : super(AdminDashboardState.intial()) {
    on<LoadAdminDashboard>((event, emit) async {
      emit(state.copyWith(isloading: true, error: null));

      try {
        final dash = await dashboardService.getAdminDashboard();

        emit(state.copyWith(isloading: false, dashboard: dash));
      } catch (e) {
        emit(state.copyWith(isloading: false, error: e.toString()));
      }
    });
  }
}
