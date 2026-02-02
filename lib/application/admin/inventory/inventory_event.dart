part of 'inventory_bloc.dart';

@freezed
class InventoryEvent with _$InventoryEvent {
  const factory InventoryEvent.loadInventory() = _LoadInventory;
  const factory InventoryEvent.updateStock({
    required AdminProductsModel product,
  }) = _UpdateStock;
}
