import 'dart:convert';

import 'data.dart';

class ProfileResponseModel {
  bool? status;
  String? msg;
  Data? data;

  ProfileResponseModel({this.status, this.msg, this.data});

  factory ProfileResponseModel.fromMap(Map<String, dynamic> data) {
    return ProfileResponseModel(
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
  /// Parses the string and returns the resulting Json object as [ProfileResponseModel].
  factory ProfileResponseModel.fromJson(String data) {
    return ProfileResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
