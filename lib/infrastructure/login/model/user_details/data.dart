import 'dart:convert';

import 'user.dart';

class Data {
  User? user;
  String? accessToken;
  String? refreshToken;

  Data({this.user, this.accessToken, this.refreshToken});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
    user: data['user'] == null
        ? null
        : User.fromMap(data['user'] as Map<String, dynamic>),
    accessToken: data['accessToken'] as String?,
    refreshToken: data['refreshToken'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'user': user?.toMap(),
    'accessToken': accessToken,
    'refreshToken': refreshToken,
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
