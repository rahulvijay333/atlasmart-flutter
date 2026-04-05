part of 'payment_status_bloc.dart';

class PaymentStatusState {
  final bool isLoading;
  final bool status;
  String? error;

  PaymentStatusState({
    required this.isLoading,
    required this.status,
    this.error,
  });

  factory PaymentStatusState.initial() {
    return PaymentStatusState(isLoading: false, status: false);
  }

  PaymentStatusState copyWith({bool? isLoading, bool? status, String? error}) {
    return PaymentStatusState(
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
