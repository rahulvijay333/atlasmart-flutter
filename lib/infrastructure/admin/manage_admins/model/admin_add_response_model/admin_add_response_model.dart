import 'dart:convert';

import 'data.dart';

class AdminAddResponseModel {
  bool? status;
  String? msg;
  Data? data;

  AdminAddResponseModel({this.status, this.msg, this.data});

  factory AdminAddResponseModel.fromMap(Map<String, dynamic> data) {
    return AdminAddResponseModel(
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
  /// Parses the string and returns the resulting Json object as [AdminAddResponseModel].
  factory AdminAddResponseModel.fromJson(String data) {
    return AdminAddResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [AdminAddResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
