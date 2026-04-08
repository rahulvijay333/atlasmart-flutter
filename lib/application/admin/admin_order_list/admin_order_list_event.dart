part of 'admin_order_list_bloc.dart';

abstract class AdminOrderListEvent {}

class LoadingAdminOrders extends AdminOrderListEvent {
  LoadingAdminOrders();
}
