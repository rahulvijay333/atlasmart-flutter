import 'dart:convert';

import 'data.dart';

class DashboardResponseModel {
  bool? status;
  String? msg;
  Data? data;

  DashboardResponseModel({this.status, this.msg, this.data});

  factory DashboardResponseModel.fromMap(Map<String, dynamic> data) {
    return DashboardResponseModel(
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
  /// Parses the string and returns the resulting Json object as [DashboardResponseModel].
  factory DashboardResponseModel.fromJson(String data) {
    return DashboardResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [DashboardResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
