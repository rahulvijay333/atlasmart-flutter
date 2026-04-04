import 'dart:developer';

import 'package:atlasmart/domain/customer/address/address_service.dart';
import 'package:atlasmart/infrastructure/customer/address/model/address_response_model/address_response_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/customer/address/model/address_model.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class AddressServiceImpl implements AddressService {
  final Dio dio;

  AddressServiceImpl({required this.dio});

  @override
  Future<List<AddressModel>> deleteUserAddress(String id) async {
    try {
      final response = await dio.delete('${ApiEndpoints.userAddress}/$id');

      if (response.statusCode == 200) {
        return _mapResponseToAddressList(response.data);
      } else {
        throw Exception('Failed to delete address');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<List<AddressModel>> getUserAddress() async {
    try {
      final response = await dio.get(ApiEndpoints.userAddress);

      if (response.statusCode == 200) {
        return _mapResponseToAddressList(response.data);
      } else {
        throw Exception('Failed to fetch addresses');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<List<AddressModel>> addAddress(AddressModel address) async {
    try {
      final response = await dio.post(
        ApiEndpoints.userAddress,
        data: address.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return _mapResponseToAddressList(response.data);
      } else {
        throw Exception('Failed to add address');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<List<AddressModel>> updateAddress(AddressModel address) async {
    try {
      if (address.id == null || address.id!.isEmpty) {
        throw Exception('Address ID is required for update');
      }

      final response = await dio.put(
        '${ApiEndpoints.userAddress}/${address.id}',
        data: address.toJson(),
      );

      if (response.statusCode == 200) {
        return _mapResponseToAddressList(response.data);
      } else {
        throw Exception('Failed to update address');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  List<AddressModel> _mapResponseToAddressList(dynamic responseData) {
    final data = AddressResponseModel.fromMap(responseData);
    final addresses = data.data?.addresses ?? [];

    return addresses.map(
      (e) => AddressModel(
        id: e.id,
        address1: e.address1 ?? '',
        street: e.street ?? '',
        city: e.city ?? '',
        state: e.state ?? '',
        pincode: e.pincode ?? '',
        country: e.country ?? '',
      ),
    ).toList();
  }
}
