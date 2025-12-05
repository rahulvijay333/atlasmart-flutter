import 'package:atlasmart/domain/constants/colors.dart';
import 'package:atlasmart/domain/constants/font.dart';
import 'package:atlasmart/domain/constants/strings.dart';
import 'package:flutter/material.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          backgroundColor: AppColors.appbarColor,
          title: Text(AppStrings.category, style: AppFont.appBar18Style),
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.all(16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: AppColors.borderColor, width: 0.8),
                ),
                child: Center(
                  child: Text(AppStrings.category, style: AppFont.title12Style),
                ),
              );
            }),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
        ),
      ],
    );
  }
}
