import 'package:atlasmart/domain/core/constants/image.dart';import 'package:atlasmart/application/admin/category_list/category_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/core/constants/strings.dart';
import '../../common/product_tile_card.dart';
import '../product/screen_product_details.dart';
import 'widgets/category_mini_tile.dart';
import 'widgets/home_carousel.dart';
import 'widgets/promo_banner_widget.dart';
import 'widgets/search_bar_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 700 && screenWidth <= 1200;

    final sidePadding = isDesktop ? 64.0 : (isTablet ? 32.0 : 16.0);
    final crossAxisCount = isDesktop ? 6 : (isTablet ? 4 : 2);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
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
          _buildSectionHeader(context, AppStrings.categories, sidePadding),

          // Horizontal Categories
          SliverToBoxAdapter(
            child: SizedBox(
              height: isDesktop ? 120 : 100,
              child: BlocBuilder<CategoryListBloc, CategoryListState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    success: (categoriesList) {
                      if (categoriesList.isEmpty) {
                        return const Center(child: Text('No categories found'));
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: sidePadding),
                        itemCount: categoriesList.length,
                        itemBuilder: (context, index) {
                          final category = categoriesList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: CatgoryMiniTileWidget(
                              title: category.categoryName,
                              imageUrl: category.categoryImage,
                              onTap: () {
                                // Navigator will be added later
                              },
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
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: sidePadding,
                vertical: 24,
              ),
              child: const PromoBannerWidget(),
            ),
          ),

          // Products Header
          _buildSectionHeader(context, 'Featured Products', sidePadding),

          // Responsive Product Grid
          SliverPadding(
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
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ScreenProductDetails(),
                      ),
                    );
                  },
                  child: const ProductTileWidget(),
                ),
                childCount: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    double padding,
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
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),
      ),
    );
  }
}

