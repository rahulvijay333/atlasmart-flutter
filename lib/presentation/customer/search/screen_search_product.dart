import 'dart:async';
import 'package:atlasmart/application/customer/home/customer_home_bloc.dart';
import 'package:atlasmart/domain/core/di/di.dart';
import 'package:atlasmart/presentation/customer/product/screen_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/product_tile_card.dart';

class ScreenSearchProduct extends StatefulWidget {
  const ScreenSearchProduct({super.key});

  @override
  State<ScreenSearchProduct> createState() => _ScreenSearchProductState();
}

class _ScreenSearchProductState extends State<ScreenSearchProduct> {
  Timer? _debounce;
  final TextEditingController _searchController = TextEditingController();

  _onSearchChanged(BuildContext context, String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<CustomerHomeBloc>().add(SearchProducts(searchKey: query));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Provide a fresh instance of CustomerHomeBloc for this screen
    // so it doesn't conflict with the home screen's fetched products.
    return BlocProvider(
      create: (context) => sl<CustomerHomeBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          titleSpacing: 0,
          title: Builder(
            builder: (context) {
              return Container(
                margin: const EdgeInsets.only(right: 16),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  onChanged: (value) => _onSearchChanged(context, value),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      context.read<CustomerHomeBloc>().add(
                        SearchProducts(searchKey: value),
                      );
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        context.read<CustomerHomeBloc>().add(
                          SearchProducts(searchKey: ''),
                        );
                        _searchController.clear();
                      },
                    ),
                    hintText: "Search products...",
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    border: OutlineInputBorder(),
                    // enabledBorder: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              );
            },
          ),
        ),
        body: Builder(
          builder: (context) {
            return BlocBuilder<CustomerHomeBloc, CustomerHomeState>(
              builder: (context, state) {
                if (state.isSearching) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.errorMessage != null && state.productList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.errorMessage!),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (_searchController.text.isNotEmpty) {
                              context.read<CustomerHomeBloc>().add(
                                SearchProducts(
                                  searchKey: _searchController.text,
                                ),
                              );
                            }
                          },
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  );
                }

                if (!state.isSearching &&
                    state.productList.isEmpty &&
                    _searchController.text.isNotEmpty) {
                  return const Center(child: Text("No products found"));
                }

                if (!state.isSearching &&
                    state.productList.isEmpty &&
                    _searchController.text.isEmpty) {
                  return const Center(child: Text("Search for products"));
                }

                // Grid setup using constants from the home screen
                var screenWidth = MediaQuery.of(context).size.width;
                bool isDesktop = screenWidth > 900;
                bool isTablet = screenWidth > 600 && screenWidth <= 900;
                int crossAxisCount = isDesktop ? 6 : (isTablet ? 4 : 2);

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: state.productList.length,
                    itemBuilder: (context, index) {
                      final product = state.productList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ScreenProductDetails(product: product),
                            ),
                          );
                        },
                        child: ProductTileWidget(product: product),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
