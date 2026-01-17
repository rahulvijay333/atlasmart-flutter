import 'package:flutter/material.dart';

import '../../../login/screen_login.dart';
import '../../../../domain/core/constants/strings.dart';

class AdminDrawerWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const AdminDrawerWidget({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Column(
        children: [
          // Premium Header
          Container(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Colors.orange.shade800,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.orange, size: 30),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        AppStrings.adminPortal,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'admin@atlasmart.com',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              children: [
                _buildDrawerItem(
                  context: context,
                  icon: Icons.dashboard_outlined,
                  selectedIcon: Icons.dashboard,
                  title: AppStrings.dashboard,
                  isSelected: selectedIndex == 0,
                  onTap: () => onDestinationSelected(0),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.shopping_bag_outlined,
                  selectedIcon: Icons.shopping_bag,
                  title: AppStrings.products,
                  isSelected:
                      selectedIndex ==
                      1, // Products is Index 1 in main screen list
                  onTap: () => onDestinationSelected(1),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.inventory_2_outlined,
                  selectedIcon: Icons.inventory_2,
                  title: AppStrings.inventory,
                  isSelected: selectedIndex == 2,
                  onTap: () => onDestinationSelected(2),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.list_alt,
                  selectedIcon: Icons.list_alt,
                  title: AppStrings.orders,
                  isSelected: selectedIndex == 3,
                  onTap: () => onDestinationSelected(3),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.payment_outlined,
                  selectedIcon: Icons.payment,
                  title: AppStrings.payments,
                  isSelected: selectedIndex == 4,
                  onTap: () => onDestinationSelected(4),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.people_outline,
                  selectedIcon: Icons.people,
                  title: AppStrings.users,
                  isSelected: selectedIndex == 5,
                  onTap: () => onDestinationSelected(5),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.admin_panel_settings_outlined,
                  selectedIcon: Icons.admin_panel_settings,
                  title: AppStrings.manageAdmins,
                  isSelected: selectedIndex == 7,
                  onTap: () => onDestinationSelected(7),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Divider(),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.notifications_none_outlined,
                  selectedIcon: Icons.notifications,
                  title: AppStrings.pushNotifications,
                  isSelected: selectedIndex == 6,
                  onTap: () => onDestinationSelected(6),
                ),
              ],
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildDrawerItem(
              context: context,
              icon: Icons.logout_rounded,
              selectedIcon: Icons.logout_rounded,
              title: AppStrings.logout,
              isSelected: false,
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) {
                      return ScreenLogin();
                    },
                  ),
                  (route) => false,
                );
              },
              isLogout: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required IconData selectedIcon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    final primaryColor = Theme.of(context).primaryColor;
    final color = isLogout
        ? Colors.red
        : (isSelected ? primaryColor : Colors.grey.shade700);
    final bgColor = isLogout
        ? Colors.red.withValues(alpha: 0.05)
        : (isSelected
              ? primaryColor.withValues(alpha: 0.1)
              : Colors.transparent);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(isSelected ? selectedIcon : icon, color: color, size: 24),
        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 15,
          ),
        ),
        onTap: onTap,
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
