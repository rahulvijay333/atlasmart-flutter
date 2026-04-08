part of 'admin_order_list_bloc.dart';

class AdminOrderListState {
  final bool isloading;
  final bool isUpdating;
  final bool? updateSuccess;
  final List<ManageAdminOrderModel> orderList;
  String? error;
  String? updateError;

  AdminOrderListState({
    required this.isloading,
    required this.isUpdating,
    this.updateSuccess,
    required this.orderList,
    this.error,
    this.updateError,
  });

  factory AdminOrderListState.initial() {
    return AdminOrderListState(
      isloading: false,
      isUpdating: false,
      orderList: [],
    );
  }

  AdminOrderListState copyWith({
    bool? isloading,
    bool? isUpdating,
    bool? updateSuccess,
    List<ManageAdminOrderModel>? orderList,
    String? error,
    String? updateError,
  }) {
    return AdminOrderListState(
      isloading: isloading ?? this.isloading,
      isUpdating: isUpdating ?? this.isUpdating,
      updateSuccess: updateSuccess,
      orderList: orderList ?? this.orderList,
      error: error ?? this.error,
      updateError: updateError ?? this.updateError,
    );
  }
}
