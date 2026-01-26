import 'dart:convert';

class Datum {
  int? id;
  String? email;
  String? name;
  String? role;
  bool? isVerified;
  dynamic profileImage;
  DateTime? createdAt;

  Datum({
    this.id,
    this.email,
    this.name,
    this.role,
    this.isVerified,
    this.profileImage,
    this.createdAt,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
    id: data['id'] as int?,
    email: data['email'] as String?,
    name: data['name'] as String?,
    role: data['role'] as String?,
    isVerified: data['is_verified'] as bool?,
    profileImage: data['profile_image'] as dynamic,
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
    'profile_image': profileImage,
    'created_at': createdAt?.toIso8601String(),
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
