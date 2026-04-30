import 'dart:convert';

import 'data.dart';

class CartResponseModel {
  bool? status;
  String? msg;
  Data? data;

  CartResponseModel({this.status, this.msg, this.data});

  factory CartResponseModel.fromMap(Map<String, dynamic> data) {
    return CartResponseModel(
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
  /// Parses the string and returns the resulting Json object as [CartResponseModel].
  factory CartResponseModel.fromJson(String data) {
    return CartResponseModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CartResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
