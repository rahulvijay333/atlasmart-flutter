import 'package:atlasmart/domain/customer/orders/order_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/customer/orders/model/ordered_product_model.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrderService orderService;

  OrdersBloc(this.orderService) : super(_Initial()) {
    on<_GetOrderedProducts>((event, emit) async {
      emit(_Loading());

      try {
        final orders = await orderService.getOrderedProductList();

        emit(_Success(orders));
      } catch (e) {
        emit(_Failure());
      }
    });
  }
}
