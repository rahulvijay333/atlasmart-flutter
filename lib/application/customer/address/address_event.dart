import 'package:atlasmart/domain/customer/address/model/address_model.dart';

abstract class AddressEvent {}

class FetchAddresses extends AddressEvent {
  FetchAddresses();
}

class AddAddress extends AddressEvent {
  final AddressModel address;
  AddAddress(this.address);
}

class UpdateAddress extends AddressEvent {
  final AddressModel address;
  UpdateAddress(this.address);
}

class DeleteAddress extends AddressEvent {
  final String id;
  DeleteAddress(this.id);
}
