import 'package:atlasmart/application/admin/category_list/category_list_bloc.dart';
import 'package:atlasmart/domain/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 700 && screenWidth <= 1200;
    @override
    // ignore: unused_local_variable
    final isMobile = screenWidth <= 700;

    final sidePadding = isDesktop ? 64.0 : (isTablet ? 32.0 : 16.0);
    final crossAxisCount = isDesktop ? 6 : (isTablet ? 4 : 2);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          title: Text(
            AppStrings.category,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        BlocBuilder<CategoryListBloc, CategoryListState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: CircularProgressIndicator()),
              ),
              success: (categories) {
                if (categories.isEmpty) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: Text('No categories found')),
                  );
                }
                return SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: 16),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final category = categories[index];
                        return Card(
                          elevation: 2,
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            onTap: () {
                              // Navigation lator by user
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: category.categoryImage.isNotEmpty
                                        ? Image.network(
                                            category.categoryImage,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) => const Icon(
                                              Icons.category_outlined,
                                              color: Colors.grey,
                                            ),
                                          )
                                        : const Icon(Icons.category_outlined, color: Colors.grey),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    category.categoryName,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: categories.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.5,
                    ),
                  ),
                );
              },
              orElse: () {
                context.read<CategoryListBloc>().add(
                  const CategoryListEvent.getAllCategoryList(),
                );
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
