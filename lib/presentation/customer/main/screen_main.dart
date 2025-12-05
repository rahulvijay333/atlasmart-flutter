import 'package:atlasmart/presentation/customer/cart/screen_cart.dart';
import 'package:atlasmart/presentation/customer/category/screen_category.dart';
import 'package:atlasmart/presentation/customer/home/screen_home.dart';
import 'package:atlasmart/presentation/customer/main/widgets/bottom_nav.dart';
import 'package:atlasmart/presentation/customer/profile/screen_profile.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final screens = [
    ScreenHome(),
    ScreenCategory(),
    ScreenCart(),
    ScreenProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
        valueListenable: BottomNavWidget.navBarNotifier,
        builder: (context, index, child) => screens[index],
      ),

      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
