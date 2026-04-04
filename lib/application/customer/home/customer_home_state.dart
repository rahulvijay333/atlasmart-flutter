part of 'customer_home_bloc.dart';

class CustomerHomeState {
  final bool isLoading;
  final List<ShopProductModel> productList;
  final String? errorMessage;

  CustomerHomeState({
    required this.isLoading,
    required this.productList,
    required this.errorMessage,
  });

  factory CustomerHomeState.initial() =>
      CustomerHomeState(isLoading: false, productList: [], errorMessage: null);

  CustomerHomeState copyWith({
    bool? isLoading,
    List<ShopProductModel>? productList,
    String? errorMessage,
  }) {
    return CustomerHomeState(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
