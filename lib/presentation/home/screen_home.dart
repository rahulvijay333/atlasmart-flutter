import 'package:atlasmart/domain/constants/font.dart';
import 'package:atlasmart/domain/constants/image.dart';
import 'package:flutter/material.dart';

import '../../domain/constants/strings.dart';
import '../common/product_tile_card.dart';
import 'widgets/category_mini_tile.dart';
import 'widgets/search_bar_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0,
          pinned: true,
          surfaceTintColor: Colors.transparent,

          backgroundColor: Colors.white,
          actions: [Icon(Icons.notifications, size: 28), SizedBox(width: 10)],
          title: Row(
            spacing: 5,
            children: [
              Image.asset(AppImage.appLogoIcon, height: 28, width: 30),
              Text(AppStrings.appTitle, style: AppFont.appBar18Style),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(65),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: SearchBarWidget(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
            child: Text(
              AppStrings.category,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 80,
            margin: EdgeInsets.only(top: 5),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Center(child: CatgoryMiniTileWidget()),
                ),
                itemCount: 10,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
            child: Text(
              AppStrings.products,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        SliverPadding(
          padding: EdgeInsetsGeometry.only(
            left: 16,
            right: 16,
            top: 5,
            bottom: 16,
          ),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.red.shade100,

                child: ProductTileWidget(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
