import 'dart:convert';

class Seller {
  String? id;
  String? email;
  String? name;
  String? brandName;

  Seller({this.id, this.email, this.name, this.brandName});

  factory Seller.fromMap(Map<String, dynamic> data) => Seller(
    id: data['_id'] as String?,
    email: data['email'] as String?,
    name: data['name'] as String?,
    brandName: data['brand_name'] as String?,
  );

  Map<String, dynamic> toMap() => {
    '_id': id,
    'email': email,
    'name': name,
    'brand_name': brandName,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Seller].
  factory Seller.fromJson(String data) {
    return Seller.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Seller] to a JSON string.
  String toJson() => json.encode(toMap());
}
