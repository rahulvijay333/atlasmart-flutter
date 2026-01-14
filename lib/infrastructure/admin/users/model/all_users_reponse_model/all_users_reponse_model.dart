import 'dart:convert';

import 'user.dart';

class AllUsersReponseModel {
  bool? status;
  String? msg;
  List<User>? data;

  AllUsersReponseModel({this.status, this.msg, this.data});

  factory AllUsersReponseModel.fromMap(Map<String, dynamic> data) {
    return AllUsersReponseModel(
      status: data['Status'] as bool?,
      msg: data['Msg'] as String?,
      data: (data['Data'] as List<dynamic>?)
          ?.map((e) => User.fromMap(e as Map<String, dynamic>))
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
  /// Parses the string and returns the resulting Json object as [AllUsersReponseModel].
  factory AllUsersReponseModel.fromJson(String data) {
    return AllUsersReponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [AllUsersReponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
