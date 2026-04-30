import 'dart:convert';

import 'data.dart';

class OrderDetailResponseModel {
  bool? status;
  String? msg;
  Data? data;

  OrderDetailResponseModel({this.status, this.msg, this.data});

  factory OrderDetailResponseModel.fromMap(Map<String, dynamic> data) {
    return OrderDetailResponseModel(
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
  /// Parses the string and returns the resulting Json object as [OrderDetailResponseModel].
  factory OrderDetailResponseModel.fromJson(String data) {
    return OrderDetailResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [OrderDetailResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
