part of 'customer_home_bloc.dart';

class CustomerHomeState {
  final bool isLoading;
  final List<ShopProductModel> productList;
  final String? errorMessage;
  final bool isSearching;

  CustomerHomeState({
    required this.isLoading,
    required this.productList,
    required this.errorMessage,
    required this.isSearching,
  });

  factory CustomerHomeState.initial() => CustomerHomeState(
    isLoading: false,
    productList: [],
    errorMessage: null,
    isSearching: false,
  );

  CustomerHomeState copyWith({
    bool? isLoading,
    List<ShopProductModel>? productList,
    String? errorMessage,
    bool? isSearching,
  }) {
    return CustomerHomeState(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
      errorMessage: errorMessage ?? this.errorMessage,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}
