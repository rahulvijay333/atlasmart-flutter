import 'dart:convert';

import 'data.dart';

class OrderedProductResponseModel {
  bool? status;
  String? msg;
  Data? data;

  OrderedProductResponseModel({this.status, this.msg, this.data});

  factory OrderedProductResponseModel.fromMap(Map<String, dynamic> data) {
    return OrderedProductResponseModel(
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
  /// Parses the string and returns the resulting Json object as [OrderedProductResponseModel].
  factory OrderedProductResponseModel.fromJson(String data) {
    return OrderedProductResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [OrderedProductResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
