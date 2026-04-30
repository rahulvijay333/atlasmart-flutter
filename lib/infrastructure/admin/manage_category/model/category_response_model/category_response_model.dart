import 'dart:convert';

import 'datum.dart';

class CategoryResponseModel {
  bool? status;
  String? msg;
  List<Datum>? data;

  CategoryResponseModel({this.status, this.msg, this.data});

  factory CategoryResponseModel.fromMap(Map<String, dynamic> data) {
    return CategoryResponseModel(
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
  /// Parses the string and returns the resulting Json object as [CategoryResponseModel].
  factory CategoryResponseModel.fromJson(String data) {
    return CategoryResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [CategoryResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
