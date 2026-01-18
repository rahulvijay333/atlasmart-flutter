import 'dart:convert';

class Data {
  int? id;
  String? email;
  String? name;
  String? role;
  bool? isVerified;
  DateTime? createdAt;

  Data({
    this.id,
    this.email,
    this.name,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
    id: data['id'] as int?,
    email: data['email'] as String?,
    name: data['name'] as String?,
    role: data['role'] as String?,
    isVerified: data['is_verified'] as bool?,
    createdAt: data['created_at'] == null
        ? null
        : DateTime.parse(data['created_at'] as String),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'email': email,
    'name': name,
    'role': role,
    'is_verified': isVerified,
    'created_at': createdAt?.toIso8601String(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
