part of 'inventory_bloc.dart';

@freezed
abstract class InventoryState with _$InventoryState {
  const factory InventoryState({
    required List<AdminProductsModel> products,
    required bool isLoading,
    required bool isUpdating,
    required bool updateSuccess,
    String? errorMessage,
    String? updateErrorMessage,
  }) = _InventoryState;

  factory InventoryState.initial() => const InventoryState(
        products: [],
        isLoading: false,
        isUpdating: false,
        updateSuccess: false,
      );
}
