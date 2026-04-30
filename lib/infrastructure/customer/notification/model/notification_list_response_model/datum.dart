import 'dart:convert';

import 'data.dart';

class Datum {
  String? id;
  String? userId;
  String? title;
  String? body;
  String? type;
  Data? data;
  bool? isRead;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.userId,
    this.title,
    this.body,
    this.type,
    this.data,
    this.isRead,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
    id: data['_id'] as String?,
    userId: data['user_id'] as String?,
    title: data['title'] as String?,
    body: data['body'] as String?,
    type: data['type'] as String?,
    data: data['data'] == null
        ? null
        : Data.fromMap(data['data'] as Map<String, dynamic>),
    isRead: data['is_read'] as bool?,
    isDeleted: data['is_deleted'] as bool?,
    createdAt: data['createdAt'] == null
        ? null
        : DateTime.parse(data['createdAt'] as String),
    updatedAt: data['updatedAt'] == null
        ? null
        : DateTime.parse(data['updatedAt'] as String),
    v: data['__v'] as int?,
  );

  Map<String, dynamic> toMap() => {
    '_id': id,
    'user_id': userId,
    'title': title,
    'body': body,
    'type': type,
    'data': data?.toMap(),
    'is_read': isRead,
    'is_deleted': isDeleted,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
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
