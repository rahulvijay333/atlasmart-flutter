import 'package:dio/dio.dart';

import '../../../domain/admin/manage_notification/manage_notification_service.dart';
import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class ManageNotificationImpl implements ManageNotificationService {
  final Dio dio;

  ManageNotificationImpl({required this.dio});

  @override
  Future<dynamic> sendPromotionMessage(String title, String body) async {
    try {
      final res = await dio.post(
        ApiEndpoints.adminPushNotifcation,
        data: {"title": title, "body": body, "data": {}},
      );
      if (res.statusCode == 200) {
        return (true);
      } else {
        return (false);
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }
}
