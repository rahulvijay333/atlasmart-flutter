import 'package:flutter/material.dart';
import '../../domain/constants/font.dart';
import '../../domain/constants/strings.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(AppStrings.cart, style: AppFont.appBar18Style),
        ),
        SliverFillRemaining(child: Center(child: Text(AppStrings.noItems))),
      ],
    );
  }
}
