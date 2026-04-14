import 'dart:convert';

class ProductDetails {
  String? id;
  String? name;
  String? price;
  int? stock;
  bool? forSale;
  dynamic expDate;
  String? imageUrl;
  String? addedBy;
  String? categoryId;
  String? brandName;
  String? companyName;
  dynamic description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProductDetails({
    this.id,
    this.name,
    this.price,
    this.stock,
    this.forSale,
    this.expDate,
    this.imageUrl,
    this.addedBy,
    this.categoryId,
    this.brandName,
    this.companyName,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProductDetails.fromMap(Map<String, dynamic> data) {
    return ProductDetails(
      id: data['_id'] as String?,
      name: data['name'] as String?,
      price: data['price'] as String?,
      stock: data['stock'] as int?,
      forSale: data['for_sale'] as bool?,
      expDate: data['exp_date'] as dynamic,
      imageUrl: data['image_url'] as String?,
      addedBy: data['added_by'] as String?,
      categoryId: data['category_id'] as String?,
      brandName: data['brand_name'] as String?,
      companyName: data['company_name'] as String?,
      description: data['description'] as dynamic,
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
      v: data['__v'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
    '_id': id,
    'name': name,
    'price': price,
    'stock': stock,
    'for_sale': forSale,
    'exp_date': expDate,
    'image_url': imageUrl,
    'added_by': addedBy,
    'category_id': categoryId,
    'brand_name': brandName,
    'company_name': companyName,
    'description': description,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductDetails].
  factory ProductDetails.fromJson(String data) {
    return ProductDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductDetails] to a JSON string.
  String toJson() => json.encode(toMap());
}
