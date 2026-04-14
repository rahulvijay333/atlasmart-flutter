import 'dart:convert';

import 'cart.dart';

class Data {
  List<Cart>? cart;

  Data({this.cart});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
    cart: (data['cart'] as List<dynamic>?)
        ?.map((e) => Cart.fromMap(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toMap() => {
    'cart': cart?.map((e) => e.toMap()).toList(),
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
