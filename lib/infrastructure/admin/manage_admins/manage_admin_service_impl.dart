import 'dart:developer';

import 'package:atlasmart/domain/admin/manage_admins/manage_admin_service.dart';
import 'package:atlasmart/domain/admin/profile/model/admin_profile.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';
import 'model/get_all_admin_response_model/get_all_admin_response_model.dart';

class ManageAdminServiceImpl implements ManageAdminService {
  final Dio dio;

  ManageAdminServiceImpl(this.dio);

  @override
  Future<bool> addNewAdmin(AdminUserModel admin) async {
    try {
      final res = await dio.post(
        ApiEndpoints.addNewAdmin,
        data: {
          "email": admin.userEmail,
          "password": admin.password,
          "name": admin.userName,
        },
      );
      if (res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<AdminUserModel> editAdmin(AdminUserModel admin) {
    // TODO: implement editAdmin
    throw UnimplementedError();
  }

  @override
  Future<List<AdminUserModel>> getAllAdmins() async {
    try {
      final res = await dio.get(
        ApiEndpoints.adminUsers,
        queryParameters: {'role': 'admin'},
      );

      if (res.statusCode == 200) {
        final data = GetAllAdminResponseModel.fromMap(res.data).data;
        final users = data!
            .map(
              (e) => AdminUserModel(
                userName: e.name ?? '',
                userEmail: e.email ?? '',
                joinedDate: e.createdAt,
              ).copyWith(userImage: e.profileImage ?? '', id: e.id),
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
  Future<bool> deleteAdmin(String adminId) async {
    try {
      final res = await dio.delete('${ApiEndpoints.adminUsers}/$adminId');

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
