import 'dart:convert';

class Product {
  String? name;
  String? price;
  int? stock;
  bool? forSale;
  dynamic expDate;
  String? imageUrl;
  String? categoryId;
  String? brandName;
  String? companyName;
  dynamic description;
  String? categoryName;
  String? id;

  Product({
    this.name,
    this.price,
    this.stock,
    this.forSale,
    this.expDate,
    this.imageUrl,
    this.categoryId,
    this.brandName,
    this.companyName,
    this.description,
    this.categoryName,
    this.id,
  });

  factory Product.fromMap(Map<String, dynamic> data) => Product(
    name: data['name'] as String?,
    price: data['price'] as String?,
    stock: data['stock'] as int?,
    forSale: data['for_sale'] as bool?,
    expDate: data['exp_date'] as dynamic,
    imageUrl: data['image_url'] as String?,
    categoryId: data['category_id'] as String?,
    brandName: data['brand_name'] as String?,
    companyName: data['company_name'] as String?,
    description: data['description'] as dynamic,
    categoryName: data['categoryName'] as String?,
    id: data['id'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'price': price,
    'stock': stock,
    'for_sale': forSale,
    'exp_date': expDate,
    'image_url': imageUrl,
    'category_id': categoryId,
    'brand_name': brandName,
    'company_name': companyName,
    'description': description,
    'categoryName': categoryName,
    'id': id,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Product].
  factory Product.fromJson(String data) {
    return Product.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
  String toJson() => json.encode(toMap());
}
