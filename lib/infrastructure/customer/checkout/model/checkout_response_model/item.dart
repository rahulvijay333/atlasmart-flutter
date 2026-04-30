import 'dart:convert';

class Item {
  String? productId;
  String? sellerId;
  String? name;
  String? unitPrice;
  int? quantity;
  String? lineTotal;

  Item({
    this.productId,
    this.sellerId,
    this.name,
    this.unitPrice,
    this.quantity,
    this.lineTotal,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
    productId: data['product_id'] as String?,
    sellerId: data['seller_id'] as String?,
    name: data['name'] as String?,
    unitPrice: data['unit_price'] as String?,
    quantity: data['quantity'] as int?,
    lineTotal: data['line_total'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'product_id': productId,
    'seller_id': sellerId,
    'name': name,
    'unit_price': unitPrice,
    'quantity': quantity,
    'line_total': lineTotal,
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
