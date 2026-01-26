part of 'admin_addor_update_product_bloc.dart';

@freezed
class AdminAddorUpdateProductEvent with _$AdminAddorUpdateProductEvent {
  const factory AdminAddorUpdateProductEvent.started() = _Started;
  const factory AdminAddorUpdateProductEvent.addProduct(
    AdminProductsModel product,
  ) = _AddProduct;
  const factory AdminAddorUpdateProductEvent.editProduct(
    AdminProductsModel product,
  ) = _EditProduct;
}
