import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/customer/home/customer_home_bloc.dart';
import '../../common/product_tile_card.dart';
import '../product/screen_product_details.dart';

class ScreenCategoryProducts extends StatelessWidget {
  const ScreenCategoryProducts({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        BlocProvider.of<CustomerHomeBloc>(context).add(LoadingHome());
      },
      child: Scaffold(
        appBar: AppBar(title: Text(categoryName, style: AppFont.appBar18Style)),
        body: BlocBuilder<CustomerHomeBloc, CustomerHomeState>(
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
                        BlocProvider.of<CustomerHomeBloc>(
                          context,
                        ).add(SearchByCategory(categoryId: categoryId));
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            if (!state.isSearching && state.productList.isEmpty) {
              return const Center(child: Text("No products found"));
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
        ),
      ),
    );
  }
}
