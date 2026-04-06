import 'dart:convert';

import 'product_details.dart';

class Item {
  String? orderId;
  String? orderNumber;
  DateTime? purchasedAt;
  String? orderStatus;
  String? productId;
  String? name;
  String? unitPrice;
  int? quantity;
  String? imageUrl;
  String? productImage;
  bool? productForSale;
  ProductDetails? productDetails;

  Item({
    this.orderId,
    this.orderNumber,
    this.purchasedAt,
    this.orderStatus,
    this.productId,
    this.name,
    this.unitPrice,
    this.quantity,
    this.imageUrl,
    this.productImage,
    this.productForSale,
    this.productDetails,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
    orderId: data['order_id'] as String?,
    orderNumber: data['order_number'] as String?,
    purchasedAt: data['purchased_at'] == null
        ? null
        : DateTime.parse(data['purchased_at'] as String),
    orderStatus: data['order_status'] as String?,
    productId: data['product_id'] as String?,
    name: data['name'] as String?,
    unitPrice: data['unit_price'] as String?,
    quantity: data['quantity'] as int?,
    imageUrl: data['image_url'] as String?,
    productImage: data['product_image'] as String?,
    productForSale: data['product_for_sale'] as bool?,
    productDetails: data['product_details'] == null
        ? null
        : ProductDetails.fromMap(
            data['product_details'] as Map<String, dynamic>,
          ),
  );

  Map<String, dynamic> toMap() => {
    'order_id': orderId,
    'order_number': orderNumber,
    'purchased_at': purchasedAt?.toIso8601String(),
    'order_status': orderStatus,
    'product_id': productId,
    'name': name,
    'unit_price': unitPrice,
    'quantity': quantity,
    'image_url': imageUrl,
    'product_image': productImage,
    'product_for_sale': productForSale,
    'product_details': productDetails?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());
}
