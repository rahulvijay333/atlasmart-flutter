part of 'customer_home_bloc.dart';

abstract class CustomerHomeEvent {}

class LoadingHome extends CustomerHomeEvent {
  LoadingHome();
}

class SearchProducts extends CustomerHomeEvent {
  final String searchKey;

  SearchProducts({required this.searchKey});
}

class SearchByCategory extends CustomerHomeEvent {
  final String categoryId;

  SearchByCategory({required this.categoryId});
}

class ClearProducts extends CustomerHomeEvent {
  ClearProducts();
}
