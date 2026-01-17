import 'dart:developer';

import 'package:atlasmart/domain/endpoints/api_endpoints.dart';
import 'package:atlasmart/domain/profile/model/profile_model.dart';
import 'package:atlasmart/domain/profile/profile_service.dart';
import 'package:atlasmart/infrastructure/profile/model/profile_response_model/profile_response_model.dart';
import 'package:dio/dio.dart';

import '../../domain/core/network/dio_error_handle.dart';

class ProfileServiceImpl implements ProfileService {
  final Dio dio;

  ProfileServiceImpl({required this.dio});

  @override
  Future<ProfileModel> editProfile(ProfileModel profile) async {
    try {
      final response = await dio.put(
        ApiEndpoints.customerProfile,
        data: {"name": profile.userName},
      );

      if (response.statusCode == 200) {
        final data = ProfileResponseModel.fromMap(response.data);

        return ProfileModel(
          userName: data.data?.name ?? '',
          userEmail: data.data?.email ?? '',
          profilePic: '',
        );
      } else {
        return ProfileModel(userName: '', userEmail: '', profilePic: '');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<ProfileModel> getProfileDetails() async {
    try {
      final response = await dio.get(ApiEndpoints.customerProfile);

      if (response.statusCode == 200) {
        final data = ProfileResponseModel.fromMap(response.data);

        return ProfileModel(
          userName: data.data?.name ?? '',
          userEmail: data.data?.email ?? '',
          profilePic: '',
        );
      } else {
        return ProfileModel(userName: '', userEmail: '', profilePic: '');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
