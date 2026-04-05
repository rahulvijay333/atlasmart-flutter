import 'razorpay_mobile.dart'
    if (dart.library.html) 'razorpay_web.dart';

class RazorpayUtil {
  final Function(String paymentId,String orderId,String signatur)? onSuccess;
  final Function(String error)? onError;
  final Function()? onCancel;

  RazorpayUtil({
    this.onSuccess,
    this.onError,
    this.onCancel,
  });

  late final RazorpayImpl _impl = RazorpayImpl(
    onSuccess: onSuccess,
    onError: onError,
    onCancel: onCancel,
  );

  void open({
    required String key,
    required int amount,
    required String name,
    required String description,
     required String orderId

  }) {
    _impl.open(
      key: key,
      amount: amount,
      name: name,
      description: description,
      orderId: orderId
  
    );
  }

  void dispose() {
    _impl.dispose();
  }
}