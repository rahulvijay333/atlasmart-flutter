part of 'checkout_bloc.dart';

abstract class CheckoutEvent {}

class Checkout extends CheckoutEvent {
  final String selectAddressId;

  Checkout({required this.selectAddressId});
}



