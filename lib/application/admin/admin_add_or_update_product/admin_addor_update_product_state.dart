part of 'admin_addor_update_product_bloc.dart';

@freezed
class AdminAddorUpdateProductState with _$AdminAddorUpdateProductState {
  const factory AdminAddorUpdateProductState.initial() = _Initial;
  const factory AdminAddorUpdateProductState.loading() = _Loading;
  const factory AdminAddorUpdateProductState.success() = _Success;
  const factory AdminAddorUpdateProductState.failure(String message) = _Failure;
}
