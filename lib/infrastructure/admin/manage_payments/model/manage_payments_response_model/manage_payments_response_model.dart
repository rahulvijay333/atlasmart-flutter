import 'dart:convert';

import 'datum.dart';

class ManagePaymentsResponseModel {
  bool? status;
  String? msg;
  List<Datum>? data;

  ManagePaymentsResponseModel({this.status, this.msg, this.data});

  factory ManagePaymentsResponseModel.fromMap(Map<String, dynamic> data) {
    return ManagePaymentsResponseModel(
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
  /// Parses the string and returns the resulting Json object as [ManagePaymentsResponseModel].
  factory ManagePaymentsResponseModel.fromJson(String data) {
    return ManagePaymentsResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [ManagePaymentsResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
