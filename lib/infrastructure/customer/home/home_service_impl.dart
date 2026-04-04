import 'dart:developer';

import 'package:atlasmart/domain/customer/home/model/shop_product_model.dart';
import 'package:atlasmart/infrastructure/customer/home/model/shop_productlist_response_model/shop_productlist_response_model.dart';
import 'package:dio/dio.dart';

import '../../../domain/core/network/dio_error_handle.dart';
import '../../../domain/customer/home/home_service.dart';
import '../../../domain/endpoints/api_endpoints.dart';

class HomeServiceImpl implements HomeService {
  final Dio dio;

  HomeServiceImpl({required this.dio});

  @override
  Future<dynamic> loadHome() async {
    try {
      final response = await dio.get(ApiEndpoints.home);

      if (response.statusCode == 200) {
        final data =
            ShopProductlistResponseModel.fromMap(
              response.data,
            ).data?.products ??
            [];

        final product = data
            .map(
              (e) => ShopProductModel(
                name: e.name ?? '',
                image: e.imageUrl ?? '',
                brandName: e.brandName ?? '',
                company: e.companyName ?? '',
                stock: e.stock ?? 0,
                price: e.price ?? '',
                description: e.description ?? '',
                categoryName: e.categoryName ?? '',
              ),
            )
            .toList();

        return product;
      } else {
        throw Exception('Failed to fetch addresses');
      }
    } on DioException catch (e) {
      log(e.toString());
      throw DioErrorHandler.handle(e);
    }
  }
}
