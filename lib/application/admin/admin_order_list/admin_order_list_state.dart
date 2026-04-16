part of 'admin_order_list_bloc.dart';

class AdminOrderListState {
  final bool isloading;
  final bool isUpdating;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final int currentPage;
  final bool? updateSuccess;
  final List<ManageAdminOrderModel> orderList;
  String? error;
  String? updateError;

  AdminOrderListState({
    required this.isloading,
    required this.isUpdating,
    required this.isLoadingMore,
    required this.hasReachedMax,
    required this.currentPage,
    this.updateSuccess,
    required this.orderList,
    this.error,
    this.updateError,
  });

  factory AdminOrderListState.initial() {
    return AdminOrderListState(
      isloading: false,
      isUpdating: false,
      isLoadingMore: false,
      hasReachedMax: false,
      currentPage: 1,
      orderList: [],
    );
  }

  AdminOrderListState copyWith({
    bool? isloading,
    bool? isUpdating,
    bool? isLoadingMore,
    bool? hasReachedMax,
    int? currentPage,
    bool? updateSuccess,
    List<ManageAdminOrderModel>? orderList,
    String? error,
    String? updateError,
  }) {
    return AdminOrderListState(
      isloading: isloading ?? this.isloading,
      isUpdating: isUpdating ?? this.isUpdating,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      updateSuccess: updateSuccess,
      orderList: orderList ?? this.orderList,
      error: error ,
      updateError: updateError ,
    );
  }
}
