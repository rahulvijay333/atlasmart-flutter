import 'dart:convert';

import 'item.dart';

class Data {
  List<Item>? items;
  int? page;
  int? limit;
  int? total;
  int? totalPages;

  Data({this.items, this.page, this.limit, this.total, this.totalPages});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
    items: (data['items'] as List<dynamic>?)
        ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
        .toList(),
    page: data['page'] as int?,
    limit: data['limit'] as int?,
    total: data['total'] as int?,
    totalPages: data['totalPages'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'items': items?.map((e) => e.toMap()).toList(),
    'page': page,
    'limit': limit,
    'total': total,
    'totalPages': totalPages,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
