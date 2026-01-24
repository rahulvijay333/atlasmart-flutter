part of 'admin_product_list_bloc.dart';

@freezed
class AdminProductListEvent with _$AdminProductListEvent {
  const factory AdminProductListEvent.started() = _Started;
  const factory AdminProductListEvent.loadAdminProductList() =
      _LoadAdminProductList;
}
