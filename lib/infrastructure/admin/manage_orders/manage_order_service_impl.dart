import 'dart:developer';

import 'package:atlasmart/domain/admin/manage_orders/manage_order_service.dart';
import 'package:atlasmart/domain/admin/manage_orders/model/manage_order_model.dart';
import 'package:atlasmart/domain/admin/manage_orders/model/status.dart';
import 'package:atlasmart/infrastructure/admin/manage_orders/model/manage_admin_orders_response/manage_admin_orders_response.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/customer/address/model/address_model.dart';
import '../../../domain/customer/orders/model/order_detail_model.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class ManageOrderServiceImpl implements ManageOrderService {
  final Dio dio;

  ManageOrderServiceImpl({required this.dio});

  @override
  Future<dynamic> getAllOrders() async {
    try {
      final res = await dio.get(ApiEndpoints.adminOrders);

      if (res.statusCode == 200) {
        final data = ManageAdminOrdersResponse.fromMap(res.data).data;
        final orderlist = data?.orders ?? [];

        final adminOrders = orderlist.map((e) {
          final items = e.items ?? [];
          final status = e.statusHistory ?? [];
          return ManageAdminOrderModel(
            orderNumber: e.orderNumber ?? '',
            orderId: e.id ?? '',
            customerName: e.userId?.name ?? '',
            customerEmail: e.userId?.email ?? '',
            date: e.createdAt?.toLocal().toString() ?? '',
            totalAmount: e.grandTotal ?? '0.00',
            statusHistory: status
                .map(
                  (e) => StatusHistoryItem(
                    status: e.status ?? '',
                    note: e.note ?? '',
                    updatedAt: e.updatedAt?.toLocal().toString() ?? '',
                  ),
                )
                .toList(),
            orderedItems: items
                .map(
                  (e) => OrderProduct(
                    brandname: e.brandName ?? '',
                    productImage: e.productImage ?? '',
                    productName: e.name ?? '',
                  )..qty = e.quantity,
                )
                .toList(),
            customerAddress: AddressModel(
              address1: e.shippingAddressSnapshot?.address1 ?? '',
              street: e.shippingAddressSnapshot?.street ?? '',
              city: e.shippingAddressSnapshot?.city ?? '',
              state: e.shippingAddressSnapshot?.state ?? '',
              pincode: e.shippingAddressSnapshot?.pincode ?? '',
              country: e.shippingAddressSnapshot?.country ?? '',
            ),
          );
        }).toList();

        return adminOrders;
      } else {
        return [];
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<void> updateOrderStatus({
    required String orderId,
    required String status,
    required String note,
  }) async {
    try {
      await dio.patch(
        '${ApiEndpoints.adminOrders}/$orderId/status',
        data: {'status': status, 'note': note},
      );
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
