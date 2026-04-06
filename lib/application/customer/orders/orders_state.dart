part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = _Loading;
  const factory OrdersState.success(List<OrderedProductModel> orderedProducts) = _Success;
  const factory OrdersState.failure() = _Failure;
  
  
  
}
