import 'dart:convert';

class Data {
  int? totalOrders;
  int? totalUserCount;
  String? totalRevenue;
  int? totalProductsCount;

  Data({
    this.totalOrders,
    this.totalUserCount,
    this.totalRevenue,
    this.totalProductsCount,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
    totalOrders: data['totalOrders'] as int?,
    totalUserCount: data['totalUserCount'] as int?,
    totalRevenue: data['totalRevenue'] as String?,
    totalProductsCount: data['totalProductsCount'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'totalOrders': totalOrders,
    'totalUserCount': totalUserCount,
    'totalRevenue': totalRevenue,
    'totalProductsCount': totalProductsCount,
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
