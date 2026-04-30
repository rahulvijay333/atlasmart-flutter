import 'dart:convert';

import 'data.dart';

class CheckoutResponseModel {
  bool? status;
  String? msg;
  Data? data;

  CheckoutResponseModel({this.status, this.msg, this.data});

  factory CheckoutResponseModel.fromMap(Map<String, dynamic> data) {
    return CheckoutResponseModel(
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
  /// Parses the string and returns the resulting Json object as [CheckoutResponseModel].
  factory CheckoutResponseModel.fromJson(String data) {
    return CheckoutResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [CheckoutResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
