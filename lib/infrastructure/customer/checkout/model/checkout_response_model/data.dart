import 'dart:convert';

import 'item.dart';
import 'summary.dart';

class Data {
  String? checkoutGroupId;
  String? clientSecret;
  String? razorpayOrderId;
  String?  razorpayId;
  String? currency;
  Summary? summary;
  List<Item>? items;

  Data({
    this.checkoutGroupId,
    this.clientSecret,
    this.razorpayOrderId,
    this.currency,
    this.summary,
    this.items,this.razorpayId
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
    checkoutGroupId: data['checkout_group_id'] as String?,
    clientSecret: data['clientSecret'] as String?,
    razorpayOrderId: data['razorpay_order_id'] as String?,
    razorpayId: data['razorpayId'] as String?,
    currency: data['currency'] as String?,
    summary: data['summary'] == null
        ? null
        : Summary.fromMap(data['summary'] as Map<String, dynamic>),
    items: (data['items'] as List<dynamic>?)
        ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toMap() => {
    'checkout_group_id': checkoutGroupId,
    'clientSecret': clientSecret,
    'razorpay_order_id': razorpayOrderId,
    'currency': currency,
    'summary': summary?.toMap(),
    'items': items?.map((e) => e.toMap()).toList(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
