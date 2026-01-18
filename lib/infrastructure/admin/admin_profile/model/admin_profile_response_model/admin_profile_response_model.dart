import 'dart:convert';

import 'data.dart';

class AdminProfileResponseModel {
  bool? status;
  String? msg;
  Data? data;

  AdminProfileResponseModel({this.status, this.msg, this.data});

  factory AdminProfileResponseModel.fromMap(Map<String, dynamic> data) {
    return AdminProfileResponseModel(
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
  /// Parses the string and returns the resulting Json object as [AdminProfileResponseModel].
  factory AdminProfileResponseModel.fromJson(String data) {
    return AdminProfileResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [AdminProfileResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
