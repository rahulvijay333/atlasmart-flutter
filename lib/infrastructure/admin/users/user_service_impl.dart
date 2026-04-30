import 'dart:developer';

import 'package:atlasmart/domain/admin/users/model/user_model.dart';
import 'package:atlasmart/domain/admin/users/user_service.dart';
import 'package:atlasmart/infrastructure/admin/users/model/all_users_reponse_model/all_users_reponse_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class UserServiceImpl implements UserService {
  final Dio dio;

  UserServiceImpl({required this.dio});

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final res = await dio.get(
        ApiEndpoints.adminUsers,
        queryParameters: {'role': 'customer'},
      );

      if (res.statusCode == 200) {
        final data = AllUsersReponseModel.fromMap(res.data).data;
        final users = data!
            .map(
              (e) => UserModel(
                userName: e.name ?? '',
                userEmail: e.email ?? '',
                joinedDate: e.createdAt,
                userImage: e.profileImage,
                id: e.id,
              ),
            )
            .toList();

        return users;
      } else {
        return [];
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<bool> deleteUser(String id) async {
    try {
      final res = await dio.delete('${ApiEndpoints.adminUsers}/$id');

      if (res.statusCode == 200) {
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
