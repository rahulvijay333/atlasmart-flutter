import 'package:atlasmart/domain/admin/manage_products/manage_products_service.dart';
import 'package:atlasmart/domain/admin/manage_products/model/admin_products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_addor_update_product_event.dart';
part 'admin_addor_update_product_state.dart';
part 'admin_addor_update_product_bloc.freezed.dart';

class AdminAddorUpdateProductBloc
    extends Bloc<AdminAddorUpdateProductEvent, AdminAddorUpdateProductState> {
  final ManageProductsService manageProductsService;

  AdminAddorUpdateProductBloc(this.manageProductsService) : super(_Initial()) {
    on<_AddProduct>((event, emit) async {
      emit(_Loading());

      try {
        final status = await manageProductsService.addProduct(event.product);

        if (status == true) {
          emit(_Success());
        } else {
          emit(_Failure('Not able to Add product, Please try after sometime'));
        }
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });

    on<_EditProduct>((event, emit) async {
      emit(_Loading());

      try {
        final status = await manageProductsService.editProduct(event.product);

        if (status == true) {
          emit(_Success());
        } else {
          emit(_Failure('Not able to Add product, Please try after sometime'));
        }
      } catch (e) {
        emit(_Failure(e.toString()));
      }
    });
  }
}
