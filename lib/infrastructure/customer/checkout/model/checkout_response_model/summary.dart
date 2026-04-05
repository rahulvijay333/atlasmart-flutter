import 'dart:convert';

class Summary {
  String? subtotal;
  String? shippingAmount;
  String? taxAmount;
  String? grandTotal;

  Summary({
    this.subtotal,
    this.shippingAmount,
    this.taxAmount,
    this.grandTotal,
  });

  factory Summary.fromMap(Map<String, dynamic> data) => Summary(
    subtotal: data['subtotal'] as String?,
    shippingAmount: data['shipping_amount'] as String?,
    taxAmount: data['tax_amount'] as String?,
    grandTotal: data['grand_total'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'subtotal': subtotal,
    'shipping_amount': shippingAmount,
    'tax_amount': taxAmount,
    'grand_total': grandTotal,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Summary].
  factory Summary.fromJson(String data) {
    return Summary.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Summary] to a JSON string.
  String toJson() => json.encode(toMap());
}
