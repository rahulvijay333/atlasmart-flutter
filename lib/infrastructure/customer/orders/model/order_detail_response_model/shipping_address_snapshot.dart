import 'dart:convert';

class ShippingAddressSnapshot {
  String? id;
  String? address1;
  String? street;
  String? city;
  String? state;
  String? pincode;
  String? country;

  ShippingAddressSnapshot({
    this.id,
    this.address1,
    this.street,
    this.city,
    this.state,
    this.pincode,
    this.country,
    
  });

  factory ShippingAddressSnapshot.fromMap(Map<String, dynamic> data) {
    return ShippingAddressSnapshot(
      id: data['id'] as String?,
      address1: data['address1'] as String?,
      street: data['Street'] as String?,
      city: data['city'] as String?,
      state: data['state'] as String?,
      pincode: data['pincode'] as String?,
      country: data['country'] as String?,
     
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'address1': address1,
    'Street': street,
    'city': city,
    'state': state,
    'pincode': pincode,
    'country': country,
    '_id': id,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShippingAddressSnapshot].
  factory ShippingAddressSnapshot.fromJson(String data) {
    return ShippingAddressSnapshot.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [ShippingAddressSnapshot] to a JSON string.
  String toJson() => json.encode(toMap());
}
