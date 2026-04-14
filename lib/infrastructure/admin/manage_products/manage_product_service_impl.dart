import 'dart:developer';

import 'package:atlasmart/domain/admin/manage_products/manage_products_service.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../../../domain/admin/manage_products/model/admin_products_model.dart';
import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/endpoints/api_endpoints.dart';
import 'model/admin_product_list_response_model/admin_product_list_response_model.dart';

class ManageProductServiceImpl implements ManageProductsService {
  final Dio dio;

  ManageProductServiceImpl(this.dio);

  @override
  Future<bool> addProduct(AdminProductsModel product) async {
    try {
      final formDataMap = <String, dynamic>{
        'name': product.name,
        'price': num.parse(product.price),
        'stock': int.parse(product.stock ?? '0'),
        'category_id': product.categoryid,
        'description': product.description,
        'for_sale': true,
      };

      if (product.newProfileImage != null) {
        final mimeType =
            lookupMimeType(product.newProfileImage!.path) ?? 'image/jpeg';
        final parts = mimeType.split('/');
        final extension = parts[1] == 'jpeg' ? 'jpg' : parts[1];

        final fileName = '${product.name}.$extension';
        final bytes = await product.newProfileImage!.readAsBytes();
        formDataMap['image'] = MultipartFile.fromBytes(
          bytes,
          filename: fileName,
          contentType: MediaType(parts[0], parts[1]),
        );
      }

      final response = await dio.post(
        ApiEndpoints.adminProducts,
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
  Future<bool> deleteProduct(String id) async {
    final res = await dio.delete('${ApiEndpoints.adminProducts}/$id');

    try {
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
  editProduct(AdminProductsModel product) async {
    try {
      final formDataMap = <String, dynamic>{
        'name': product.name,
        'price': num.parse(product.price),
        'stock': int.parse(product.stock ?? '0'),
        'category_id': product.categoryid,
        'description': product.description,
        'for_sale': true,
      };

      if (product.newProfileImage != null) {
        final mimeType =
            lookupMimeType(product.newProfileImage!.path) ?? 'image/jpeg';
        final parts = mimeType.split('/');
        final extension = parts[1] == 'jpeg' ? 'jpg' : parts[1];

        final fileName = '${product.name}.$extension';
        final bytes = await product.newProfileImage!.readAsBytes();
        formDataMap['image'] = MultipartFile.fromBytes(
          bytes,
          filename: fileName,
          contentType: MediaType(parts[0], parts[1]),
        );
      }

      final response = await dio.put(
        '${ApiEndpoints.adminProducts}/${product.id}',
        data: FormData.fromMap(formDataMap),
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.statusCode == 200) {
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
  Future<List<AdminProductsModel>> getAllProducts() async {
    try {
      final res = await dio.get(ApiEndpoints.adminProducts);
      if (res.statusCode == 200) {
        final data = AdminProductListResponseModel.fromMap(res.data).data;
        final users = data!
            .map(
              (e) => AdminProductsModel(
                name: e.name ?? '',
                description: e.description ??'',
                price: e.price ?? '',
                id: e.id,
                stock: e.stock?.toString(),
                image: e.imageUrl,
                categoryid: e.categoryId,
                brandName: e.brandName,
                companyName: e.companyName,
              ),
            )
            .toList();

        return users;
      } else {
        return [];
      }
    } on DioException catch (e) {
      // log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
