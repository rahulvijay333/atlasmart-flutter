import 'dart:convert';

import 'item.dart';
import 'payment.dart';
import 'shipping_address_snapshot.dart';
import 'status_history.dart';
import 'user_id.dart';

class Order {
  String? id;
  String? checkoutGroupId;
  UserId? userId;
  String? sellerId;
  List<Item>? items;
  ShippingAddressSnapshot? shippingAddressSnapshot;
  String? currency;
  String? subtotal;
  String? shippingAmount;
  String? taxAmount;
  String? discountAmount;
  String? grandTotal;
  String? status;
  List<StatusHistory>? statusHistory;
  Payment? payment;
  String? orderNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Order({
    this.id,
    this.checkoutGroupId,
    this.userId,
    this.sellerId,
    this.items,
    this.shippingAddressSnapshot,
    this.currency,
    this.subtotal,
    this.shippingAmount,
    this.taxAmount,
    this.discountAmount,
    this.grandTotal,
    this.status,
    this.statusHistory,
    this.payment,
    this.orderNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Order.fromMap(Map<String, dynamic> data) => Order(
    id: data['_id'] as String?,
    checkoutGroupId: data['checkout_group_id'] as String?,
    userId: data['user_id'] == null
        ? null
        : UserId.fromMap(data['user_id'] as Map<String, dynamic>),
    sellerId: data['seller_id'] as String?,
    items: (data['items'] as List<dynamic>?)
        ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
        .toList(),
    shippingAddressSnapshot: data['shipping_address_snapshot'] == null
        ? null
        : ShippingAddressSnapshot.fromMap(
            data['shipping_address_snapshot'] as Map<String, dynamic>,
          ),
    currency: data['currency'] as String?,
    subtotal: data['subtotal'] as String?,
    shippingAmount: data['shipping_amount'] as String?,
    taxAmount: data['tax_amount'] as String?,
    discountAmount: data['discount_amount'] as String?,
    grandTotal: data['grand_total'] as String?,
    status: data['status'] as String?,
    statusHistory: (data['status_history'] as List<dynamic>?)
        ?.map((e) => StatusHistory.fromMap(e as Map<String, dynamic>))
        .toList(),
    payment: data['payment'] == null
        ? null
        : Payment.fromMap(data['payment'] as Map<String, dynamic>),
    orderNumber: data['order_number'] as String?,
    createdAt: data['createdAt'] == null
        ? null
        : DateTime.parse(data['createdAt'] as String),
    updatedAt: data['updatedAt'] == null
        ? null
        : DateTime.parse(data['updatedAt'] as String),
    v: data['__v'] as int?,
  );

  Map<String, dynamic> toMap() => {
    '_id': id,
    'checkout_group_id': checkoutGroupId,
    'user_id': userId?.toMap(),
    'seller_id': sellerId,
    'items': items?.map((e) => e.toMap()).toList(),
    'shipping_address_snapshot': shippingAddressSnapshot?.toMap(),
    'currency': currency,
    'subtotal': subtotal,
    'shipping_amount': shippingAmount,
    'tax_amount': taxAmount,
    'discount_amount': discountAmount,
    'grand_total': grandTotal,
    'status': status,
    'status_history': statusHistory?.map((e) => e.toMap()).toList(),
    'payment': payment?.toMap(),
    'order_number': orderNumber,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Order].
  factory Order.fromJson(String data) {
    return Order.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Order] to a JSON string.
  String toJson() => json.encode(toMap());
}
