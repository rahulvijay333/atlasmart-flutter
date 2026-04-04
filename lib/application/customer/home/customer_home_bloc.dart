import 'package:atlasmart/domain/customer/home/home_service.dart';
import 'package:atlasmart/domain/customer/home/model/shop_product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'customer_home_event.dart';
part 'customer_home_state.dart';

class CustomerHomeBloc extends Bloc<CustomerHomeEvent, CustomerHomeState> {
  final HomeService homeService;

  CustomerHomeBloc(this.homeService) : super(CustomerHomeState.initial()) {
    on<LoadingHome>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      try {
        final data = await homeService.loadHome();

        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: null,
            productList: data,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: e.toString(),
            productList: [],
          ),
        );
      }
    });
  }
}
