import 'package:atlasmart/domain/customer/orders/order_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/customer/orders/model/ordered_product_model.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrderService orderService;

  OrdersBloc(this.orderService) : super(const _Initial()) {
    on<_GetOrderedProducts>((event, emit) async {
      emit(const _Loading());
      try {
        final orders = await orderService.getOrderedProductList(event.page);
        final List<OrderedProductModel> orderList =
            List<OrderedProductModel>.from(orders);

        emit(
          _Success(
            orderList,
            currentPage: event.page,
            hasReachedMax: orderList.isEmpty,
          ),
        );
      } catch (e) {
        emit(const _Failure());
      }
    });

    on<_LoadMoreOrders>((event, emit) async {
      final currentState = state;
      if (currentState is _Success) {
        if (currentState.hasReachedMax || currentState.isLoadingMore) return;

        emit(currentState.copyWith(isLoadingMore: true));

        try {
          final nextPage = currentState.currentPage + 1;
          final ordersList = await orderService.getOrderedProductList(nextPage);
          final List<OrderedProductModel> newOrders =
              List<OrderedProductModel>.from(ordersList);

          emit(
            currentState.copyWith(
              orderedProducts: [...currentState.orderedProducts, ...newOrders],
              isLoadingMore: false,
              currentPage: nextPage,
              hasReachedMax: newOrders.isEmpty,
            ),
          );
        } catch (e) {
          emit(currentState.copyWith(isLoadingMore: false));
        }
      }
    });
  }
}
