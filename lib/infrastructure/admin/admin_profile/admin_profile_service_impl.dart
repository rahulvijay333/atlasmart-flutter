import 'dart:convert';
import 'dart:developer';

import 'package:atlasmart/domain/admin/profile/admin_profile_service.dart';
import 'package:atlasmart/domain/admin/profile/model/admin_profile.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';
import 'model/admin_profile_response_model/admin_profile_response_model.dart';

class AdminProfileServiceImpl implements AdminProfileService {
  final Dio dio;

  AdminProfileServiceImpl(this.dio);

  @override
  Future<AdminUserModel> editProfile(AdminUserModel profile) async {
    try {
      final formDataMap = <String, dynamic>{
        'name': profile.userName,
        'brandName': profile.brandName,
        'companyName': profile.companyName,
      };

      if (profile.newProfileImage != null) {
        final mimeType =
            lookupMimeType(profile.newProfileImage!.path) ?? 'image/jpeg';
        final parts = mimeType.split('/');
        final extension = parts[1] == 'jpeg' ? 'jpg' : parts[1];

        final fileName = '${profile.userName}.$extension';
        formDataMap['profileImage'] = await MultipartFile.fromFile(
          profile.newProfileImage!.path,
          filename: fileName,
          contentType: MediaType(parts[0], parts[1]),
        );
      }

      final response = await dio.put(
        ApiEndpoints.adminProfile,
        data: FormData.fromMap(formDataMap),
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.statusCode == 200) {
        final data = AdminProfileResponseModel.fromMap(response.data);

        return AdminUserModel(
          userName: data.data?.name ?? '',
          userEmail: data.data?.email ?? '',
          joinedDate: data.data?.createdAt,
        ).copyWith(
          userImage: data.data?.profileImage,
          companyName: data.data?.companyName,
          brandName: data.data?.brandName,
        );
      } else {
        throw Exception('Profile update failed');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<AdminUserModel> getProfileDetails() async {
    try {
      final response = await dio.get(ApiEndpoints.adminProfile);

      if (response.statusCode == 200) {
        final data = AdminProfileResponseModel.fromJson(
          jsonEncode(response.data),
        );

        return AdminUserModel(
          userName: data.data?.name ?? '',
          userEmail: data.data?.email ?? '',
          joinedDate: null,
        ).copyWith(
          userImage: data.data?.profileImage,
          companyName: data.data?.companyName,
          brandName: data.data?.brandName,
        );
      } else {
        return AdminUserModel(userName: '', userEmail: '', joinedDate: null);
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
