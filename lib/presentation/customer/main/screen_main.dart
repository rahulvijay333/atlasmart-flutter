import 'package:atlasmart/presentation/customer/cart/screen_cart.dart';
import 'package:atlasmart/presentation/customer/category/screen_category.dart';
import 'package:atlasmart/presentation/customer/home/screen_home.dart';
import 'package:atlasmart/presentation/customer/main/widgets/bottom_nav.dart';
import 'package:atlasmart/presentation/customer/profile/screen_profile.dart';
import 'package:flutter/material.dart';

import '../../../domain/core/util/firebase/firebase.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  final screens = [
    ScreenHome(),
    ScreenCategory(),
    ScreenCart(),
    ScreenProfile(),
  ];

  @override
  void initState() {
    super.initState();
    // 🔗 Handle any deep link that was stored during app startup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FirebaseNotificationService.instance.processInitialMessage();
    });
  }

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
