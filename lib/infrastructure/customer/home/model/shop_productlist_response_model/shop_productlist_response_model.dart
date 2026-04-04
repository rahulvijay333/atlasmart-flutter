import 'dart:convert';

import 'data.dart';

class ShopProductlistResponseModel {
  bool? status;
  String? msg;
  Data? data;

  ShopProductlistResponseModel({this.status, this.msg, this.data});

  factory ShopProductlistResponseModel.fromMap(Map<String, dynamic> data) {
    return ShopProductlistResponseModel(
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
  /// Parses the string and returns the resulting Json object as [ShopProductlistResponseModel].
  factory ShopProductlistResponseModel.fromJson(String data) {
    return ShopProductlistResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [ShopProductlistResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
