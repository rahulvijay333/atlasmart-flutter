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
      emit(
        state.copyWith(
          isloading: true,
          error: null,
          hasReachedMax: false,
          currentPage: event.page,
          orderList: event.isRefresh ? [] : state.orderList,
        ),
      );

      try {
        final ordersList = await manageOrderService.getAllOrders(event.page);

        final List<ManageAdminOrderModel> orders =
            List<ManageAdminOrderModel>.from(ordersList);

        bool hasReachedMax = false;
        if (orders.isEmpty ||
            (orders.isNotEmpty &&
                orders.first.currentPage >= orders.first.totalPages)) {
          hasReachedMax = true;
        }

        emit(
          state.copyWith(
            isloading: false,
            orderList: event.isRefresh
                ? orders
                : [...state.orderList, ...orders],
            hasReachedMax: hasReachedMax,
          ),
        );
      } catch (e) {
        emit(state.copyWith(isloading: false, error: e.toString()));
      }
    });

    on<LoadMoreAdminOrders>((event, emit) async {
      if (state.hasReachedMax || state.isLoadingMore || state.isloading) return;

      emit(state.copyWith(isLoadingMore: true, error: null));

      try {
        final nextPage = state.currentPage + 1;
        final ordersList = await manageOrderService.getAllOrders(nextPage);
        final List<ManageAdminOrderModel> orders =
            List<ManageAdminOrderModel>.from(ordersList);

        bool hasReachedMax = false;
        if (orders.isEmpty ||
            (orders.isNotEmpty &&
                orders.first.currentPage >= orders.first.totalPages)) {
          hasReachedMax = true;
        }

        emit(
          state.copyWith(
            isLoadingMore: false,
            orderList: [...state.orderList, ...orders],
            currentPage: nextPage,
            hasReachedMax: hasReachedMax,
          ),
        );
      } catch (e) {
        emit(state.copyWith(isLoadingMore: false, error: e.toString()));
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
        add(LoadingAdminOrders(isRefresh: true));
        emit(state.copyWith(isUpdating: false, updateSuccess: true));
      } catch (e) {
        emit(state.copyWith(isUpdating: false, updateError: e.toString()));
      }
    });
  }
}
