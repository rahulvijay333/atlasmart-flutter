import 'dart:math';

import 'package:atlasmart/domain/customer/cart/cart_service.dart';
import 'package:atlasmart/domain/customer/cart/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartService cartService;

  CartBloc(this.cartService) : super(CartState.initial()) {
    on<GetCart>((event, emit) async {
      emit(state.copyWith(isloading: true, error: null));

      try {
        final cart = await cartService.getCart();

        emit(state.copyWith(isloading: false, cartList: cart));
      } catch (e) {
        emit(
          state.copyWith(isloading: false, cartList: [], error: e.toString()),
        );
      }
    });

    on<AddorUpdateCart>((event, emit) async {
      //use this for add and update , for add cartid wont be there.

      emit(state.copyWith(ismodifyingCart: true, error: null));

      try {
        final cart = await cartService.addOrUpdateCart(
          event.cartID ?? '',
          event.productID,
          event.qty,
        );

        emit(state.copyWith(ismodifyingCart: false, cartList: cart));
      } catch (e) {
        emit(state.copyWith(ismodifyingCart: false, error: e.toString()));
      }
    });

    on<DeleteCart>((event, emit) async {
      emit(state.copyWith(ismodifyingCart: true, error: null));

      try {
        final cart = await cartService.deleteCart(event.productID);

        emit(state.copyWith(ismodifyingCart: false, cartList: cart));
      } catch (e) {
        emit(state.copyWith(ismodifyingCart: false, error: e.toString()));
      }
    });

    on<ClearCart>((event, emit) async {
      emit(state.copyWith(ismodifyingCart: true, error: null));

      try {
        final cart = await cartService.deleleAllCart();

        emit(state.copyWith(ismodifyingCart: false, cartList: cart));
      } catch (e) {
        emit(
          state.copyWith(
            ismodifyingCart: false,
            cartList: [],
            error: e.toString(),
          ),
        );
      }
    });

    on<ClearErrorMessage>((event, emit) {
      emit(state.copyWith(error: null));
    });
  }
}
