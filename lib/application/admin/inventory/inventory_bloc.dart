import 'package:atlasmart/domain/admin/manage_products/manage_products_service.dart';
import 'package:atlasmart/domain/admin/manage_products/model/admin_products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';
part 'inventory_bloc.freezed.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final ManageProductsService _manageProductsService;

  InventoryBloc(this._manageProductsService) : super(InventoryState.initial()) {
    on<_LoadInventory>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          errorMessage: null,
          // Reset success state on new load
          updateSuccess: false,
        ),
      );

      try {
        final products = await _manageProductsService.getAllProducts();
        emit(state.copyWith(isLoading: false, products: products));
      } catch (e) {
        emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      }
    });

    on<_UpdateStock>((event, emit) async {
      emit(
        state.copyWith(
          isUpdating: true,
          updateSuccess: false,
          updateErrorMessage: null,
        ),
      );

      try {
        final success = await _manageProductsService.editProduct(event.product);
        if (success) {
          emit(state.copyWith(isUpdating: false, updateSuccess: true));
          // Trigger local refresh
          add(const InventoryEvent.loadInventory());
        } else {
          emit(
            state.copyWith(
              isUpdating: false,
              updateSuccess: false,
              updateErrorMessage: 'Update failed',
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            isUpdating: false,
            updateSuccess: false,
            updateErrorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
