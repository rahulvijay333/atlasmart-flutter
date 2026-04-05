part of 'checkout_bloc.dart';

class CheckoutState {
  final bool isloading;
  final CheckoutModel? checkoutData;
  String? error;

  CheckoutState({
    required this.isloading,
    required this.checkoutData,
    this.error,
  });

  factory CheckoutState.initial() {
    return CheckoutState(isloading: false, checkoutData: null, error: null);
  }

  CheckoutState copyWith({
    bool? isloading,

    CheckoutModel? checkoutData,
    String? error,
  }) {
    return CheckoutState(
      isloading: isloading ?? this.isloading,
      checkoutData: checkoutData ?? this.checkoutData,
      error: error ?? this.error,
    );
  }
}
