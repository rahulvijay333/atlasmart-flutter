import 'package:atlasmart/domain/admin/dashboard/dashboard_service.dart';
import 'package:atlasmart/domain/admin/dashboard/model/admin_dashboard_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';
import 'model/dashboard_response_model/dashboard_response_model.dart';

class DashboardServiceImpl extends DashboardService {
  final Dio dio;

  DashboardServiceImpl({required this.dio});

  @override
  Future<dynamic> getAdminDashboard() async {
    try {
      final res = await dio.get(ApiEndpoints.adminDashboard);
      if (res.statusCode == 200) {
        final data = DashboardResponseModel.fromMap(res.data).data;
        final dashboard = AdminDashboardModel(
          userCount: data?.totalUserCount ?? 0,
          orderCount: data?.totalOrders ?? 0,
          totalRevenue: data?.totalRevenue ?? '',
          productsCount: data?.totalProductsCount ?? 0,
        );

        return dashboard;
      }
    } on DioException catch (e) {
      // log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
