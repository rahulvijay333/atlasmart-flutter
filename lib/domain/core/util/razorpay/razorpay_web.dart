import 'dart:js' as js;

class RazorpayImpl {
  final Function(String paymentId, String orderId, String signature)? onSuccess;
  final Function(String error)? onError;
  final Function()? onCancel;

  RazorpayImpl({this.onSuccess, this.onError, this.onCancel});

  bool _isCompleted = false;

  void open({
    required String key,
    required int amount,
    required String name,
    required String description,
    required String orderId,
  }) {
    _isCompleted = false;

    final options = js.JsObject.jsify({
      "key": key,
      "amount": amount,
      "name": name,
      "description": description,
      "order_id": orderId,

      // "prefill": {
      //   "email": email,
      //   "contact": contact,
      // },

      // ✅ SUCCESS
      "handler": (response) {
        _isCompleted = true;

        final paymentId = response['razorpay_payment_id'];
        final orderId = response['razorpay_order_id'];
        final signature = response['razorpay_signature'];

        onSuccess?.call(paymentId, orderId, signature);
      },

      // ✅ CANCEL (close / ESC / outside click)
      "modal": {
        "ondismiss": () {
          if (!_isCompleted) {
            onCancel?.call();
          }
        },
      },
    });

    final razorpay = js.JsObject(js.context['Razorpay'], [options]);

    // ❌ FAILURE
    razorpay.callMethod('on', [
      'payment.failed',
      (response) {
        _isCompleted = true;
        final error = response['error'];
        onError?.call(error?['description'] ?? "Payment failed");
      },
    ]);

    razorpay.callMethod('open');
  }

  void dispose() {}
}
