import 'dart:convert';

import 'datum.dart';

class NotificationListResponseModel {
  bool? success;
  List<Datum>? data;
  int? total;
  int? page;
  int? limit;

  NotificationListResponseModel({
    this.success,
    this.data,
    this.total,
    this.page,
    this.limit,
  });

  factory NotificationListResponseModel.fromMap(Map<String, dynamic> data) {
    return NotificationListResponseModel(
      success: data['success'] as bool?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
          .toList(),
      total: data['total'] as int?,
      page: data['page'] as int?,
      limit: data['limit'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
    'success': success,
    'data': data?.map((e) => e.toMap()).toList(),
    'total': total,
    'page': page,
    'limit': limit,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NotificationListResponseModel].
  factory NotificationListResponseModel.fromJson(String data) {
    return NotificationListResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [NotificationListResponseModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
