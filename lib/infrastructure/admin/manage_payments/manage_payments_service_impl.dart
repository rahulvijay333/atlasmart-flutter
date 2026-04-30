import 'package:atlasmart/domain/admin/manage_payments/manage_payments_service.dart';
import 'package:atlasmart/domain/admin/manage_payments/model/manage_payments_model.dart';
import 'package:atlasmart/infrastructure/admin/manage_payments/model/manage_payments_response_model/manage_payments_response_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class ManagePaymentsServiceImpl implements ManagePaymentsService {
  final Dio dio;

  ManagePaymentsServiceImpl({required this.dio});

  @override
  Future<dynamic> getAllPayments() async {
    try {
      final res = await dio.get(ApiEndpoints.adminPayments);
      if (res.statusCode == 200) {
        final data = ManagePaymentsResponseModel.fromMap(res.data).data;
        final payments = data!
            .map(
              (e) => ManagePaymentsModel(
                paymentid: e.payment?.razorpayOrderId ?? '',
                totalAmount: e.grandTotal ?? '',
                status: e.status ?? '',
                date: e.createdAt.toString(),
                customerName: e.customer?.name ?? '',
                orderNumber: e.orderNumber ?? '',
              ),
            )
            .toList();

        return payments;
      } else {
        return [];
      }
    } on DioException catch (e) {
      // log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
