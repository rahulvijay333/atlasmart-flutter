part of 'admin_order_list_bloc.dart';

class AdminOrderListState {
  final bool isloading;
  final List<ManageAdminOrderModel> orderList;
  String? error;

  AdminOrderListState({
    required this.isloading,
    required this.orderList,
    this.error,
  });

  factory AdminOrderListState.initial() {
    return AdminOrderListState(isloading: false, orderList: []);
  }

  AdminOrderListState copyWith({
    bool? isloading,
    List<ManageAdminOrderModel>? orderList,
    String? error,
  }) {
    return AdminOrderListState(
      isloading: isloading ?? this.isloading,
      orderList: orderList ?? this.orderList,
      error: error ?? this.error,
    );
  }
}
