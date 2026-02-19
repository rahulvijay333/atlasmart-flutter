import 'package:atlasmart/domain/core/constants/strings.dart';
import 'package:flutter/material.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 700 && screenWidth <= 1200;
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
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                elevation: 2,
                surfaceTintColor: Colors.white,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.category_outlined,
                          size: 32,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${AppStrings.categoryPlaceholder} ${index + 1}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }, childCount: 12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
