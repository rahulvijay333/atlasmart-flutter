import 'dart:developer';

import 'package:atlasmart/domain/customer/cart/cart_service.dart';
import 'package:atlasmart/domain/customer/cart/model/cart_model.dart';
import 'package:atlasmart/infrastructure/customer/cart/model/cart_response_model/cart_response_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class CartServiceImpl implements CartService {
  final Dio dio;

  CartServiceImpl({required this.dio});

  @override
  Future<dynamic> addOrUpdateCart(
    String cartId,
    String productId,
    String qty,
  ) async {
    try {
      final response = await dio.post(
        ApiEndpoints.cart,
        data: {
          "product_id": productId,
          if (cartId.isNotEmpty) "cart_item_id": cartId,
          "quantity": qty,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = CartResponseModel.fromMap(response.data).data?.cart ?? [];

        final cart = data
            .map(
              (e) => CartModel(
                id: e.id ?? '',
                productId: e.productId ?? '',
                name: e.productName ?? '',
                image: e.productImage ?? '',
                brandName: e.brandName ?? '',
                company: e.companyName ?? '',
                stock: e.stock ?? 0,
                price: e.totalPrice ?? '',
                qty: e.quantity ?? 1,
              ),
            )
            .toList();

        return cart;
      } else {
        throw Exception('Failed to add to cart');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<dynamic> deleleAllCart() async {
    try {
      final response = await dio.delete(ApiEndpoints.cart);

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = CartResponseModel.fromMap(response.data).data?.cart ?? [];

        final cart = data
            .map(
              (e) => CartModel(
                id: e.id ?? '',
                productId: e.productId ?? '',
                name: e.productName ?? '',
                image: e.productImage ?? '',
                brandName: e.brandName ?? '',
                company: e.companyName ?? '',
                stock: e.stock ?? 0,
                price: e.totalPrice ?? '',
                qty: e.quantity ?? 1,
              ),
            )
            .toList();

        return cart;
      } else {
        throw Exception('Failed to clear cart');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<dynamic> deleteCart(String id) async {
    try {
      final response = await dio.delete('${ApiEndpoints.cart}/$id');

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = CartResponseModel.fromMap(response.data).data?.cart ?? [];

        final cart = data
            .map(
              (e) => CartModel(
                id: e.id ?? '',
                productId: e.productId ?? '',
                name: e.productName ?? '',
                image: e.productImage ?? '',
                brandName: e.brandName ?? '',
                company: e.companyName ?? '',
                stock: e.stock ?? 0,
                price: e.totalPrice ?? '',
                qty: e.quantity ?? 1,
              ),
            )
            .toList();

        return cart;
      } else {
        throw Exception('Failed to remove item');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<dynamic> getCart() async {
    try {
      final response = await dio.get(ApiEndpoints.cart);

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = CartResponseModel.fromMap(response.data).data?.cart ?? [];

        final cart = data
            .map(
              (e) => CartModel(
                id: e.id ?? '',
                productId: e.productId ?? '',
                name: e.productName ?? '',
                image: e.productImage ?? '',
                brandName: e.brandName ?? '',
                company: e.companyName ?? '',
                stock: e.stock ?? 0,
                price: e.totalPrice ?? '',
                qty: e.quantity ?? 1,
              ),
            )
            .toList();

        return cart;
      } else {
        throw Exception('Failed to get cart');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
