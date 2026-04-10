import 'dart:convert';

class Data {
  String? orderId;

  Data({this.orderId});

  factory Data.fromMap(Map<String, dynamic> data) =>
      Data(orderId: data['orderId'] as String?);

  Map<String, dynamic> toMap() => {'orderId': orderId};

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
