import 'dart:convert';

import 'customer.dart';
import 'payment.dart';
import 'seller.dart';

class Datum {
  String? id;
  String? orderNumber;
  String? status;
  String? grandTotal;
  String? currency;
  DateTime? createdAt;
  Customer? customer;
  Seller? seller;
  Payment? payment;

  Datum({
    this.id,
    this.orderNumber,
    this.status,
    this.grandTotal,
    this.currency,
    this.createdAt,
    this.customer,
    this.seller,
    this.payment,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
    id: data['id'] as String?,
    orderNumber: data['order_number'] as String?,
    status: data['status'] as String?,
    grandTotal: data['grand_total'] as String?,
    currency: data['currency'] as String?,
    createdAt: data['createdAt'] == null
        ? null
        : DateTime.parse(data['createdAt'] as String),
    customer: data['customer'] == null
        ? null
        : Customer.fromMap(data['customer'] as Map<String, dynamic>),
    seller: data['seller'] == null
        ? null
        : Seller.fromMap(data['seller'] as Map<String, dynamic>),
    payment: data['payment'] == null
        ? null
        : Payment.fromMap(data['payment'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'order_number': orderNumber,
    'status': status,
    'grand_total': grandTotal,
    'currency': currency,
    'createdAt': createdAt?.toIso8601String(),
    'customer': customer?.toMap(),
    'seller': seller?.toMap(),
    'payment': payment?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());
}
