import 'dart:developer';

import 'package:atlasmart/domain/customer/address/model/address_model.dart';
import 'package:atlasmart/domain/customer/checkout/model/checkout_model.dart';
import 'package:atlasmart/domain/customer/orders/model/order_detail_model.dart';
import 'package:atlasmart/domain/customer/orders/order_service.dart';
import 'package:atlasmart/infrastructure/customer/orders/model/order_detail_response_model/order_detail_response_model.dart';
import 'package:atlasmart/infrastructure/customer/orders/model/ordered_product_response_model/ordered_product_response_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/customer/orders/model/ordered_product_model.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class OrderServiceImpl implements OrderService {
  final Dio dio;

  OrderServiceImpl({required this.dio});

  @override
  Future<dynamic> getOrderDetails(String orderId) async {
    final response = await dio.get('${ApiEndpoints.order}/$orderId');

    try {
      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = OrderDetailResponseModel.fromMap(response.data).data;

        final items = data?.order?.items ?? [];

        final order = data?.order;

        final orderDetail = OrderDetailModel(
          orderNumber: order?.orderNumber ?? '',
          purchaseDate: order?.createdAt?.toLocal().toString() ?? '',
          orderedProducts: items
              .map(
                (e) => OrderProduct(
                  productName: e.name ?? '',
                  productImage: e.productImage ?? '',
                  brandname: e.brandName ?? '',
                ),
              )
              .toList(),
          deliveryAddress: AddressModel.fromJson(
            order?.shippingAddressSnapshot?.toMap() ?? {},
          ),
          priceSummary: Summary(
            subtotal: order?.subtotal ?? '',
            shippingAmount: order?.shippingAmount ?? '',
            taxAmount: order?.taxAmount ?? '',
            grandTotal: order?.grandTotal ?? '',
          ),
        );

        return orderDetail;
      } else {
        throw Exception('Failed to order details');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<dynamic> getOrderedProductList() async {
    try {
      final response = await dio.get(ApiEndpoints.purchasedProducts);

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = OrderedProductResponseModel.fromMap(response.data).data;

        final items = data?.items ?? [];

        final productlist = items
            .map(
              (e) => OrderedProductModel(
                orderId: e.orderId ?? '',
                orderNumber: e.orderNumber ?? '',
                purchaseDate: e.purchasedAt?.toLocal().toString() ?? '',
                productName: e.name ?? '',
                productImage: e.productImage ?? '',
                brandname: e.productDetails?.brandName ?? '',
              ),
            )
            .toList();

        return productlist;
      } else {
        throw Exception('Failed to orders');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
