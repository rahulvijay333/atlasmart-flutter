import 'package:atlasmart/domain/admin/manage_admins/manage_admin_service.dart';
import 'package:atlasmart/domain/admin/profile/model/admin_profile.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';

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
  Future<bool> deleteAdmin(AdminUserModel admin) {
    // TODO: implement deleteAdmin
    throw UnimplementedError();
  }

  @override
  Future<AdminUserModel> editAdmin(AdminUserModel admin) {
    // TODO: implement editAdmin
    throw UnimplementedError();
  }

  @override
  Future<List<AdminUserModel>> getAllAdmins() {
    // TODO: implement getAllAdmins
    throw UnimplementedError();
  }
}
