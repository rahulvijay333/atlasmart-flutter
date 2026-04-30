import 'package:atlasmart/domain/customer/checkout/checkout_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_status_event.dart';
part 'payment_status_state.dart';

class PaymentStatusBloc extends Bloc<PaymentStatusEvent, PaymentStatusState> {
  final CheckoutService checkoutService;

  PaymentStatusBloc(this.checkoutService)
    : super(PaymentStatusState.initial()) {
    on<UpdatePaymentStatus>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      try {
        final bool status = await checkoutService.updatePaymentStatus(
          event.orderId,
          event.paymentId,
          event.signature,
        );

        emit(state.copyWith(isLoading: false, status: status));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });
  }
}
