import 'dart:convert';

import 'product.dart';

class Data {
  List<Product>? products;
  int? totalPages;
  int? limit;
  int? currentPage;

  Data({this.products, this.totalPages, this.limit, this.currentPage});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
    products: (data['products'] as List<dynamic>?)
        ?.map((e) => Product.fromMap(e as Map<String, dynamic>))
        .toList(),
    totalPages: data['totalPages'] as int?,
    limit: data['limit'] as int?,
    currentPage: data['currentPage'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'products': products?.map((e) => e.toMap()).toList(),
    'totalPages': totalPages,
    'limit': limit,
    'currentPage': currentPage,
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
