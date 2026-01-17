import 'package:flutter/material.dart';

class AdminBottomNavWidget extends StatelessWidget {
  const AdminBottomNavWidget({super.key});

  static ValueNotifier<int> adminNavBarNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: adminNavBarNotifier,
      builder: (context, newIndex, _) {
        return NavigationBar(
          selectedIndex: newIndex,
          onDestinationSelected: (index) {
            adminNavBarNotifier.value = index;
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(Icons.people_outline),
              selectedIcon: Icon(Icons.people),
              label: 'Users',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_bag_outlined),
              selectedIcon: Icon(Icons.shopping_bag),
              label: 'Products',
            ),
            NavigationDestination(
              icon: Icon(Icons.inventory_outlined),
              selectedIcon: Icon(Icons.inventory),
              label: 'Inventory',
            ),
            NavigationDestination(
              icon: Icon(Icons.list_alt_outlined),
              selectedIcon: Icon(Icons.list_alt),
              label: 'Orders',
            ),
            NavigationDestination(
              icon: Icon(Icons.payment_outlined),
              selectedIcon: Icon(Icons.payment),
              label: 'Payments',
            ),
          ],
        );
      },
    );
  }
}
