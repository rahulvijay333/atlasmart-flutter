class AddressModel {
  final String address1;
  final String street;
  final String city;
  final String state;
  final String pincode;
  final String country;
  String? id;

  AddressModel({
    required this.address1,
    required this.street,
    required this.city,
    required this.state,
    required this.pincode,
    required this.country,
    this.id,
  });

  // Create model from JSON
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address1: json['address1'] ?? '',
      street: json['Street'] ?? json['street'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      pincode: json['pincode'] ?? '',
      country: json['country'] ?? '',
      id: json['id'] ?? json['_id'],
    );
  }

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'address1': address1,
      'Street': street,
      'city': city,
      'state': state,
      'pincode': pincode,
      'country': country,
    };
  }
}
