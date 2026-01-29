import 'package:atlasmart/domain/admin/manage_products/manage_products_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/admin/manage_products/model/admin_products_model.dart';

part 'admin_product_list_event.dart';
part 'admin_product_list_state.dart';
part 'admin_product_list_bloc.freezed.dart';

class AdminProductListBloc
    extends Bloc<AdminProductListEvent, AdminProductListState> {
  final ManageProductsService manageProductsService;

  AdminProductListBloc(this.manageProductsService) : super(_Initial()) {
    on<_LoadAdminProductList>((event, emit) async {
      emit(_Loading());

      try {
        final productList = await manageProductsService.getAllProducts();

        emit(_Success(productList));
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });

    on<_DeleteProduct>((event, emit) async {
      emit(_Loading());

      try {
        final status = await manageProductsService.deleteProduct(event.id);
        if (status == true) {
          add(_LoadAdminProductList());
        } else {
          emit(_Failure('Failed to delete this product'));
        }
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
  }
}
