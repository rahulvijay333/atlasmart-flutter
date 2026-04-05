part of 'payment_status_bloc.dart';

abstract class PaymentStatusEvent {}

class UpdatePaymentStatus extends PaymentStatusEvent {
  final String orderId;
  final String paymentId;
  final String signature;

  UpdatePaymentStatus({
    required this.orderId,
    required this.paymentId,
    required this.signature,
  });
}
