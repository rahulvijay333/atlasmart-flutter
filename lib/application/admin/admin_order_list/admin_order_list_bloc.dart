import 'package:atlasmart/domain/admin/manage_orders/manage_order_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/admin/manage_orders/model/manage_order_model.dart';

part 'admin_order_list_event.dart';
part 'admin_order_list_state.dart';

class AdminOrderListBloc
    extends Bloc<AdminOrderListEvent, AdminOrderListState> {
  final ManageOrderService manageOrderService;

  AdminOrderListBloc(this.manageOrderService)
    : super(AdminOrderListState.initial()) {
    on<LoadingAdminOrders>((event, emit) async {
      emit(state.copyWith(isloading: true, error: null));

      try {
        final orders = await manageOrderService.getAllOrders();

        emit(state.copyWith(isloading: false, orderList: orders));
      } catch (e) {
        emit(state.copyWith(isloading: false, error: e.toString()));
      }
    });

    on<UpdateOrderStatus>((event, emit) async {
      emit(
        state.copyWith(
          isUpdating: true,
          updateError: null,
          updateSuccess: null,
        ),
      );

      try {
        await manageOrderService.updateOrderStatus(
          orderId: event.orderId,
          status: event.status,
          note: event.note,
        );

        // Success: Reload orders and signal success
        add(LoadingAdminOrders());
        emit(state.copyWith(isUpdating: false, updateSuccess: true));
      } catch (e) {
        emit(state.copyWith(isUpdating: false, updateError: e.toString()));
      }
    });
  }
}
