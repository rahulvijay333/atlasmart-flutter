part of 'cart_bloc.dart';

abstract class CartEvent {}

class GetCart extends CartEvent {}

class AddorUpdateCart extends CartEvent {
  final String productID;
  final String qty;
  String? cartID;

  AddorUpdateCart({required this.productID, required this.qty, this.cartID});
}

class DeleteCart extends CartEvent {
  final String productID;

  DeleteCart({required this.productID});
}

class ClearCart extends CartEvent {
  ClearCart();
}
