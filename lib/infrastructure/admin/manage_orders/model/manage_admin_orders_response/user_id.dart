import 'dart:convert';

class UserId {
  String? id;
  String? email;
  String? name;

  UserId({this.id, this.email, this.name});

  factory UserId.fromMap(Map<String, dynamic> data) => UserId(
    id: data['_id'] as String?,
    email: data['email'] as String?,
    name: data['name'] as String?,
  );

  Map<String, dynamic> toMap() => {'_id': id, 'email': email, 'name': name};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserId].
  factory UserId.fromJson(String data) {
    return UserId.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserId] to a JSON string.
  String toJson() => json.encode(toMap());
}
