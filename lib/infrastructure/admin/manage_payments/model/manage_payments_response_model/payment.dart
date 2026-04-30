import 'dart:convert';

class Payment {
  String? provider;
  String? paymentIntentId;
  String? razorpayOrderId;

  Payment({this.provider, this.paymentIntentId, this.razorpayOrderId});

  factory Payment.fromMap(Map<String, dynamic> data) => Payment(
    provider: data['provider'] as String?,
    paymentIntentId: data['payment_intent_id'] as String?,
    razorpayOrderId: data['razorpay_order_id'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'provider': provider,
    'payment_intent_id': paymentIntentId,
    'razorpay_order_id': razorpayOrderId,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Payment].
  factory Payment.fromJson(String data) {
    return Payment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Payment] to a JSON string.
  String toJson() => json.encode(toMap());
}
