part of 'cart_bloc.dart';

class CartState {
  final bool isloading;
  final bool ismodifyingCart;
  final List<CartModel> cartList;
  String? error;

  CartState({
    required this.isloading,
    required this.ismodifyingCart,
    required this.cartList,
    this.error,
  });

  factory CartState.initial() {
    return CartState(isloading: false, ismodifyingCart: false, cartList: []);
  }

  CartState copyWith({
    bool? isloading,

    bool? ismodifyingCart,
    List<CartModel>? cartList,
    String? error,
  }) {
    return CartState(
      isloading: isloading ?? this.isloading,
      ismodifyingCart: ismodifyingCart ?? this.ismodifyingCart,
      cartList: cartList ?? this.cartList,
      error: error ?? this.error,
    );
  }
}
