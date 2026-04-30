part of 'admin_payment_list_bloc.dart';

class AdminPaymentListState {
  final bool isloading;
  final List<ManagePaymentsModel> payments;
  String? error;

  AdminPaymentListState({
    required this.isloading,
    required this.payments,
    this.error,
  });
  factory AdminPaymentListState.initial() {
    return AdminPaymentListState(isloading: false, payments: [], error: null);
  }

  AdminPaymentListState copyWith({
    bool? isloading,
    List<ManagePaymentsModel>? payments,
    String? error,
  }) {
    return AdminPaymentListState(
      isloading: isloading ?? this.isloading,
      payments: payments ?? this.payments,
      error: error,
    );
  }
}
