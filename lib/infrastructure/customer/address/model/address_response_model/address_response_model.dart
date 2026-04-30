import 'dart:convert';

import 'data.dart';

class AddressResponseModel {
  bool? status;
  String? msg;
  Data? data;

  AddressResponseModel({this.status, this.msg, this.data});

  factory AddressResponseModel.fromMap(Map<String, dynamic> data) {
    return AddressResponseModel(
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
  /// Parses the string and returns the resulting Json object as [AddressResponseModel].
  factory AddressResponseModel.fromJson(String data) {
    return AddressResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [AddressResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
