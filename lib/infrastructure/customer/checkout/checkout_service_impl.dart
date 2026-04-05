import 'dart:developer';

import 'package:atlasmart/domain/customer/checkout/checkout_service.dart';
import 'package:atlasmart/domain/customer/checkout/model/checkout_model.dart';
import 'package:atlasmart/infrastructure/customer/checkout/model/checkout_response_model/checkout_response_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class CheckoutServiceImpl implements CheckoutService {
  final Dio dio;

  CheckoutServiceImpl({required this.dio});

  @override
  Future<dynamic> checkout(String addressId) async {
    try {
      final response = await dio.post(
        ApiEndpoints.checkout,
        data: {"address_id": addressId},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = CheckoutResponseModel.fromMap(response.data).data;

        final checkout = CheckoutModel(
          razorpayKey: data?.razorpayId ?? '',
          razorpayOrderId: data?.razorpayOrderId ?? '',
          summary: Summary.fromJson(data?.summary?.toMap() ?? {}),
        );

        return checkout;
      } else {
        throw Exception('Failed to checkout');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<dynamic> updatePaymentStatus(
    String orderId,
    String paymentId,
    String signature,
  ) async {
    try {
      final response = await dio.post(
        ApiEndpoints.verifyPayment,
        data: {
          "razorpay_order_id": orderId,
          "razorpay_payment_id": paymentId,
          "razorpay_signature": signature,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
