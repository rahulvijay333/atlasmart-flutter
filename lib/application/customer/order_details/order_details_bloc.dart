import 'package:atlasmart/domain/customer/orders/order_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/customer/orders/model/order_detail_model.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';
part 'order_details_bloc.freezed.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  final OrderService orderService;

  OrderDetailsBloc(this.orderService) : super(_Initial()) {
    on<_GetOrderDetails>((event, emit) async {
      emit(_Loading());

      try {
        final order = await orderService.getOrderDetails(event.orderId);

        emit(_Success(order));
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
  }
}
