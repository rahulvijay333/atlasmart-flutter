import 'package:atlasmart/domain/customer/checkout/checkout_service.dart';
import 'package:atlasmart/domain/customer/checkout/model/checkout_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutService checkoutService;

  CheckoutBloc(this.checkoutService) : super(CheckoutState.initial()) {
    on<Checkout>((event, emit) async {
      emit(state.copyWith(isloading: true, error: null));

      try {
        final data = await checkoutService.checkout(event.selectAddressId);

        emit(state.copyWith(isloading: false, checkoutData: data));
      } catch (e) {
        emit(
          state.copyWith(
            isloading: false,
            checkoutData: null,
            error: e.toString(),
          ),
        );
      }
    });
  }
}
