import 'dart:convert';

import 'datum.dart';

class AdminProductListResponseModel {
  bool? status;
  String? msg;
  List<Datum>? data;

  AdminProductListResponseModel({this.status, this.msg, this.data});

  factory AdminProductListResponseModel.fromMap(Map<String, dynamic> data) {
    return AdminProductListResponseModel(
      status: data['Status'] as bool?,
      msg: data['Msg'] as String?,
      data: (data['Data'] as List<dynamic>?)
          ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
    'Status': status,
    'Msg': msg,
    'Data': data?.map((e) => e.toMap()).toList(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AdminProductListResponseModel].
  factory AdminProductListResponseModel.fromJson(String data) {
    return AdminProductListResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [AdminProductListResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
