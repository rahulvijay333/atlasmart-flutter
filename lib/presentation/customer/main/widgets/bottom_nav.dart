import 'package:atlasmart/application/profile/customer/customer_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/core/constants/strings.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  static final ValueNotifier<int> navBarNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: navBarNotifier,
      builder: (context, value, child) {
        return BottomNavigationBar(
          elevation: 0,

          // landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            navBarNotifier.value = value;

            switch (value) {
              case 3:
                BlocProvider.of<CustomerProfileBloc>(
                  context,
                ).add(CustomerProfileEvent.getProfileDetails());
                break;
            }
          },
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey,
          currentIndex: navBarNotifier.value,
          items: [
            //home
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppStrings.home,
            ),

            //categories
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_4x4),
              label: AppStrings.category,
            ),
            //cart
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: AppStrings.cart,
            ),

            //profile
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: AppStrings.profile,
            ),
          ],
        );
      },
    );
  }
}
