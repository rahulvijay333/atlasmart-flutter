import 'dart:convert';

import 'data.dart';

class UserDetails {
  bool? status;
  String? msg;
  Data? data;

  UserDetails({this.status, this.msg, this.data});

  factory UserDetails.fromMap(Map<String, dynamic> data) => UserDetails(
    status: data['Status'] as bool?,
    msg: data['Msg'] as String?,
    data: data['Data'] == null
        ? null
        : Data.fromMap(data['Data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toMap() => {
    'Status': status,
    'Msg': msg,
    'Data': data?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserDetails].
  factory UserDetails.fromJson(String data) {
    return UserDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserDetails] to a JSON string.
  String toJson() => json.encode(toMap());
}
