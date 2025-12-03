import 'package:flutter/material.dart';

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
          },
          selectedItemColor: Colors.amber.shade800,
          unselectedItemColor: Colors.grey,
          currentIndex: navBarNotifier.value,
          items: [
            //home
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
        
            //categories
            BottomNavigationBarItem(icon: Icon(Icons.grid_4x4), label: 'Category'),
            //cart
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
        
            //profile
            BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Profile'),
          ],
        );
      }
    );
  }
}
