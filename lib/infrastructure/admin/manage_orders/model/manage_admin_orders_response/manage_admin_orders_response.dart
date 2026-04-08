import 'dart:convert';

import 'data.dart';

class ManageAdminOrdersResponse {
  bool? status;
  String? msg;
  Data? data;

  ManageAdminOrdersResponse({this.status, this.msg, this.data});

  factory ManageAdminOrdersResponse.fromMap(Map<String, dynamic> data) {
    return ManageAdminOrdersResponse(
      status: data['Status'] as bool?,
      msg: data['Msg'] as String?,
      data: data['Data'] == null
          ? null
          : Data.fromMap(data['Data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
    'Status': status,
    'Msg': msg,
    'Data': data?.toMap(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ManageAdminOrdersResponse].
  factory ManageAdminOrdersResponse.fromJson(String data) {
    return ManageAdminOrdersResponse.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [ManageAdminOrdersResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
