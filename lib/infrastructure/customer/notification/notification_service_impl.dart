import 'dart:developer';

import 'package:atlasmart/domain/customer/notifications/model/notification_model.dart';
import 'package:atlasmart/domain/customer/notifications/notification_service.dart';
import 'package:atlasmart/infrastructure/customer/notification/model/notification_list_response_model/notification_list_response_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class NotificationServiceImpl implements NotificationService {
  final Dio dio;

  NotificationServiceImpl({required this.dio});

  @override
  Future<dynamic> clearAllNotifications() {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getAllNotifications() async {
    try {
      final response = await dio.get(ApiEndpoints.notifications);

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data =
            NotificationListResponseModel.fromMap(response.data).data ?? [];

        final notificationList = data
            .map(
              (e) => NotificationModel(
                title: e.title ?? '',
                description: e.body ?? '',
                date: e.createdAt?.toLocal().toString() ?? '',
                type: e.type ?? '',
                parameter: e.data?.orderId,
              ),
            )
            .toList();

        return notificationList;
      } else {
        throw Exception('Failed to get notifications');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
