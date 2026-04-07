import 'dart:developer';

import 'package:atlasmart/application/customer/home/customer_home_bloc.dart';
import 'package:atlasmart/domain/core/constants/image.dart';
import 'package:atlasmart/application/admin/category_list/category_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/core/constants/strings.dart';
import '../../common/product_tile_card.dart';
import '../category/screen_category_products.dart';
import '../main/widgets/bottom_nav.dart';
import '../product/screen_product_details.dart';
import 'widgets/category_mini_tile.dart';
import 'widgets/home_carousel.dart';
import 'widgets/search_bar_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CustomerHomeBloc>().add(LoadingHome());
      context.read<CategoryListBloc>().add(
        const CategoryListEvent.getAllCategoryList(),
      );
    });



    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 700 && screenWidth <= 1200;

    final sidePadding = isDesktop ? 64.0 : (isTablet ? 32.0 : 16.0);
    final crossAxisCount = isDesktop ? 6 : (isTablet ? 4 : 2);
 

   

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CustomerHomeBloc>().add(LoadingHome());
          context.read<CategoryListBloc>().add(
            const CategoryListEvent.getAllCategoryList(),
          );
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              toolbarHeight: 70,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined, size: 28),
                ),
                const SizedBox(width: 8),
              ],
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImage.appLogoIcon, height: 32, width: 32),
                  const SizedBox(width: 12),
                  Text(
                    AppStrings.appTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: sidePadding,
                    right: sidePadding,
                    bottom: 16,
                  ),
                  child: const SearchBarWidget(),
                ),
              ),
            ),

            // Hero Carousel
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sidePadding - 8,
                  vertical: 16,
                ),
                child: const HomeCarousel(),
              ),
            ),

            // Categories Header
            _buildSectionHeader(
              context,
              AppStrings.categories,
              sidePadding,
              context.select((CategoryListBloc bloc) {
                return bloc.state.maybeWhen(
                  success: (list) => list.isEmpty,
                  orElse: () => false,
                );
              }),
              () {
                BottomNavWidget.navBarNotifier.value = 1;
              },
            ),

            // Horizontal Categories
            SliverToBoxAdapter(
              child: SizedBox(
                height: isDesktop ? 120 : 100,
                child: BlocBuilder<CategoryListBloc, CategoryListState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      failure: (message) {
                        return Center(
                          child: Column(
                            children: [
                              Text(message),
                              IconButton(
                                onPressed: () {
                                  context.read<CategoryListBloc>().add(
                                    const CategoryListEvent.getAllCategoryList(),
                                  );
                                },
                                icon: Icon(Icons.refresh),
                              ),
                            ],
                          ),
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (categoriesList) {
                        if (categoriesList.isEmpty) {
                          return const Center(
                            child: Text('No categories found'),
                          );
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                            horizontal: sidePadding,
                          ),
                          itemCount: categoriesList.length,
                          itemBuilder: (context, index) {
                            final category = categoriesList[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<CustomerHomeBloc>(
                                    context,
                                  ).add(
                                    SearchByCategory(
                                      categoryId: category.id ?? '',
                                    ),
                                  );
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ScreenCategoryProducts(
                                          categoryName: category.categoryName,
                                          categoryId: category.id ?? '',
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: CatgoryMiniTileWidget(
                                  title: category.categoryName,
                                  imageUrl: category.categoryImage,
                                  onTap: () {
                                    // Navigator will be added later
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      orElse: () {
                        context.read<CategoryListBloc>().add(
                          const CategoryListEvent.getAllCategoryList(),
                        );
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                  },
                ),
              ),
            ),

            // Promo Banner Area
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: sidePadding,
            //       vertical: 24,
            //     ),
            //     child: const PromoBannerWidget(),
            //   ),
            // ),

            // Products Header
            _buildSectionHeader(
              context,
              'Featured Products',
              sidePadding,
              true,
              () {},
            ),

            // Responsive Product Grid
            BlocBuilder<CustomerHomeBloc, CustomerHomeState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (state.errorMessage != null && state.productList.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Column(
                        children: [
                          Text(state.errorMessage!),
                          IconButton(
                            onPressed: () {
                              context.read<CustomerHomeBloc>().add(
                                LoadingHome(),
                              );
                            },
                            icon: Icon(Icons.refresh),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (state.productList.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Column(
                        children: [
                          Text('No products found'),
                          IconButton(
                            onPressed: () {
                              context.read<CustomerHomeBloc>().add(
                                LoadingHome(),
                              );
                            },
                            icon: Icon(Icons.refresh),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return SliverPadding(
                  padding: EdgeInsets.only(
                    left: sidePadding,
                    right: sidePadding,
                    bottom: 32,
                  ),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
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
                    }, childCount: state.productList.length),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    double padding,
    bool showViewAll,
    Function() ontap,
  ) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: padding,
          right: padding,
          top: 16,
          bottom: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
            if (showViewAll == false)
              TextButton(onPressed: ontap, child: const Text('View All')),
          ],
        ),
      ),
    );
  }
}
