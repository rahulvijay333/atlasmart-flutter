import 'dart:convert';

class Cart {
  String? id;
  String? productId;
  int? quantity;
  String? totalPrice;
 
  String? productName;
  String? brandName;
  String? companyName;
  String? productImage;
  int? stock;

  Cart({
    this.id,
    this.productId,
    this.quantity,
    this.totalPrice,
  
    this.productName,
    this.brandName,
    this.companyName,
    this.productImage,
    this.stock,
  });

  factory Cart.fromMap(Map<String, dynamic> data) => Cart(
    id: data['id'] as String?,
    productId: data['product_id'] as String?,
    quantity: data['quantity'] as int?,
    totalPrice: data['total_price'] as String?,
  
    productName: data['product_name'] as String?,
    brandName: data['brand_name'] as String?,
    companyName: data['company_name'] as String?,
    productImage: data['product_image'] as String?,
    stock: data['stock'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'product_id': productId,
    'quantity': quantity,
    'total_price': totalPrice,
    '_id': id,
    'product_name': productName,
    'brand_name': brandName,
    'company_name': companyName,
    'product_image': productImage,
    'stock': stock,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cart].
  factory Cart.fromJson(String data) {
    return Cart.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cart] to a JSON string.
  String toJson() => json.encode(toMap());
}
