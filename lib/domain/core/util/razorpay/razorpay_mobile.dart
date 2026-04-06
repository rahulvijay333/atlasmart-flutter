import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayImpl {
  final Function(String paymentId, String orderId, String signatur)? onSuccess;
  final Function(String error)? onError;
  final Function()? onCancel;

  late Razorpay _razorpay;

  RazorpayImpl({this.onSuccess, this.onError, this.onCancel}) {
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (PaymentSuccessResponse res) {
      onSuccess?.call(
        res.paymentId ?? "",
        res.orderId ?? '',
        res.signature ?? '',
      );
    });

    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse res) {
      // Detect cancel
      if (res.code == Razorpay.PAYMENT_CANCELLED) {
        onCancel?.call();
      } else {
        onError?.call(res.message ?? "Payment failed");
      }
    });
  }

  void open({
    required String key,
    required int amount,
    required String name,
    required String description,
    required String orderId,
    // required String email,
    // required String contact,
  }) {
    final options = {
      'key': key,
      'amount': amount,
      'name': name,
      'description': description,
      'order_id': orderId,
      // 'prefill': {
      //   'contact': contact,
      //   'email': email,
      // },
    };

    _razorpay.open(options);
  }

  void dispose() {
    _razorpay.clear();
  }
}
