import 'dart:convert';

class User {
  String? id;
  String? email;
  String? name;
  String? role;
  bool? isVerified;
  DateTime? createdAt;
  String? profileImage;

  User({
    this.id,
    this.email,
    this.name,
    this.role,
    this.isVerified,
    this.createdAt,
    this.profileImage,
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
    id: data['id'] as String?,
    email: data['email'] as String?,
    name: data['name'] as String?,
    role: data['role'] as String?,
    isVerified: data['is_verified'] as bool?,
    profileImage: data['profile_image'] ?? '',
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
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());
}
