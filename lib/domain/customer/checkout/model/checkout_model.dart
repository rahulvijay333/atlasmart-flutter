class CheckoutModel {
  final String razorpayOrderId;
  final String razorpayKey;

  final Summary summary;

  CheckoutModel({
    required this.razorpayOrderId,
    required this.summary,
    required this.razorpayKey,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      razorpayOrderId: json['razorpay_order_id'] as String,
      razorpayKey: json['razorpayId'],

      summary: Summary.fromJson(json['summary']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'razorpay_order_id': razorpayOrderId, 'summary': summary.toJson()};
  }
}

class Summary {
  final String subtotal;
  final String shippingAmount;
  final String taxAmount;
  final String grandTotal;

  Summary({
    required this.subtotal,
    required this.shippingAmount,
    required this.taxAmount,
    required this.grandTotal,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      subtotal: json['subtotal'] as String,
      shippingAmount: json['shipping_amount'] as String,
      taxAmount: json['tax_amount'] as String,
      grandTotal: json['grand_total'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping_amount': shippingAmount,
      'tax_amount': taxAmount,
      'grand_total': grandTotal,
    };
  }
}
