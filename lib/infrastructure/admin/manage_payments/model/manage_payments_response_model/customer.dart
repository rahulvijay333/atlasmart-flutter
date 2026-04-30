import 'dart:convert';

class Customer {
  String? id;
  String? email;
  String? name;

  Customer({this.id, this.email, this.name});

  factory Customer.fromMap(Map<String, dynamic> data) => Customer(
    id: data['_id'] as String?,
    email: data['email'] as String?,
    name: data['name'] as String?,
  );

  Map<String, dynamic> toMap() => {'_id': id, 'email': email, 'name': name};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Customer].
  factory Customer.fromJson(String data) {
    return Customer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Customer] to a JSON string.
  String toJson() => json.encode(toMap());
}
