import 'dart:convert';

class Datum {
  String? id;
  String? name;
  String? price;
  int? stock;
  bool? forSale;
  DateTime? expDate;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic imageUrl;
  String? categoryId;

  Datum({
    this.id,
    this.name,
    this.price,
    this.stock,
    this.forSale,
    this.expDate,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.categoryId
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
    id: data['id'] as String?,
    name: data['name'] as String?,
    price: data['price'] as String?,
    stock: data['stock'] as int?,
    forSale: data['for_sale'] as bool?,
    expDate: data['exp_date'] == null
        ? null
        : DateTime.parse(data['exp_date'] as String),
    deletedAt: data['deleted_at'] as dynamic,
    createdAt: data['created_at'] == null
        ? null
        : DateTime.parse(data['created_at'] as String),
    updatedAt: data['updated_at'] == null
        ? null
        : DateTime.parse(data['updated_at'] as String),
    imageUrl: data['image_url'] as dynamic,
    categoryId: data['category_id']
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'price': price,
    'stock': stock,
    'for_sale': forSale,
    'exp_date': expDate?.toIso8601String(),
    'deleted_at': deletedAt,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'image_url': imageUrl,
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
