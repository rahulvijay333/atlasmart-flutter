import 'dart:developer';

import 'package:atlasmart/domain/admin/manage_category/manage_category.dart';
import 'package:atlasmart/domain/admin/manage_category/model/category_model.dart';
import 'package:atlasmart/infrastructure/admin/manage_category/model/category_response_model/category_response_model.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class ManageCategoryServiceImpl implements ManageCategoryService {
  final Dio dio;

  ManageCategoryServiceImpl({required this.dio});

  @override
 Future<bool> addCategory(CategoryModel category) async {
    try {
      final formDataMap = <String, dynamic>{'name': category.categoryName};

      if (category.selectedImage != null) {
        final mimeType =
            lookupMimeType(category.selectedImage!.path) ?? 'image/jpeg';
        final parts = mimeType.split('/');
        final extension = parts[1] == 'jpeg' ? 'jpg' : parts[1];

        final fileName = '${category.categoryName}.$extension';
        formDataMap['image'] = await MultipartFile.fromFile(
          category.selectedImage!.path,
          filename: fileName,
          contentType: MediaType(parts[0], parts[1]),
        );
      }

      final response = await dio.post(
        ApiEndpoints.category,
        data: FormData.fromMap(formDataMap),
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    } catch (e) {
      log(e.toString());
      throw 'Error';
    }
  }

  @override
  deleteCategory(String id) async {
    try {
      final res = await dio.delete('${ApiEndpoints.category}/$id');

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

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final res = await dio.get(ApiEndpoints.category);

      if (res.statusCode == 200) {
        final data = CategoryResponseModel.fromMap(res.data).data;
        final users = data!
            .map(
              (e) => CategoryModel(
                categoryName: e.name ?? '',
                categoryImage: e.image ?? '',
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
}
