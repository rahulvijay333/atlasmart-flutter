part of 'orders_bloc.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.started() = _Started;
  const factory OrdersEvent.getOrderedProducts({
    @Default(1) int page,
    @Default(false) bool isRefresh,
  }) = _GetOrderedProducts;
  const factory OrdersEvent.loadMoreOrders() = _LoadMoreOrders;
}
