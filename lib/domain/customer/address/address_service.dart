import 'model/address_model.dart';

abstract class AddressService {
  Future<List<AddressModel>> getUserAddress();
  Future<List<AddressModel>> addAddress(AddressModel address);
  Future<List<AddressModel>> updateAddress(AddressModel address);
  Future<List<AddressModel>> deleteUserAddress(String id);
}
