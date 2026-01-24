part of 'admin_product_list_bloc.dart';

@freezed
class AdminProductListState with _$AdminProductListState {
  const factory AdminProductListState.initial() = _Initial;
  const factory AdminProductListState.loading() = _Loading;
  const factory AdminProductListState.success(List<AdminProductsModel>products) = _Success;
  const factory AdminProductListState.failure(String message) = _Failure;
}
