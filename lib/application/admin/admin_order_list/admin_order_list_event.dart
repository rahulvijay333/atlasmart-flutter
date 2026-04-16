part of 'admin_order_list_bloc.dart';

abstract class AdminOrderListEvent {}

class LoadingAdminOrders extends AdminOrderListEvent {
  final int page;
  final bool isRefresh;
  LoadingAdminOrders({this.page = 1, this.isRefresh = false});
}

class LoadMoreAdminOrders extends AdminOrderListEvent {}

class UpdateOrderStatus extends AdminOrderListEvent {
  final String orderId;
  final String status;
  final String note;

  UpdateOrderStatus({
    required this.orderId,
    required this.status,
    required this.note,
  });
}
