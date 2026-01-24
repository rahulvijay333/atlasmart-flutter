import 'package:atlasmart/application/admin/admin_list/admin_list_bloc.dart';
import 'package:atlasmart/application/admin/admin_product_list/admin_product_list_bloc.dart';
import 'package:atlasmart/domain/core/constants/constants.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/admin/users/all_users_bloc.dart';
import '../../../domain/core/constants/strings.dart';
import '../dashboard/screen_dashboard.dart';
import '../users/screen_users.dart';
import '../products/screen_products.dart';
import '../products/screen_add_product.dart';
import '../inventory/screen_inventory.dart';
import '../orders/screen_orders.dart';
import '../payments/screen_payments.dart';
import '../notifications/screen_push_notifications.dart';
import '../admin_management/screen_manage_admins.dart';
import 'widgets/admin_drawer.dart';

class ScreenAdminMain extends StatefulWidget {
  const ScreenAdminMain({super.key, required this.role});

  final String role;

  @override
  State<ScreenAdminMain> createState() => _ScreenAdminMainState();
}

class _ScreenAdminMainState extends State<ScreenAdminMain> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ScreenAdminDashboard(),
    const ScreenAdminProducts(),
    const ScreenInventory(),
    const ScreenAdminOrders(),
    const ScreenAdminPayments(),

    const ScreenAdminUsers(),
    const ScreenPushNotifications(),
    const ScreenManageAdmins(),
  ];

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return AppStrings.dashboard;
      case 1:
        return AppStrings.products;
      case 2:
        return AppStrings.inventory;
      case 3:
        return AppStrings.orders;
      case 4:
        return AppStrings.payments;
      case 5:
        return AppStrings.users; // Not 'User Management'
      case 6:
        return AppStrings.pushNotifications;
      case 7:
        return AppStrings.manageAdmins;
      default:
        return AppStrings.adminPortal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_getAppBarTitle()), scrolledUnderElevation: 0),
      drawer: AdminDrawerWidget(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          if (index == 5 || index == 7) {
            if (widget.role == AppConstants.superUser) {
              setState(() {
                _selectedIndex = index;
              });
              if (index == 5) {
                BlocProvider.of<AllUsersBloc>(
                  context,
                ).add(AllUsersEvent.getAllUsers());
              }

              if(index ==7) {
                context.read<AdminListBloc>().add(AdminListEvent.getAllAdminList());
              }
            } else {
              AppSnackBar.show(context, 'Not available for your account');
            }
          } else {
            setState(() {
              _selectedIndex = index;
            });

            if (index == 1) {
              context.read<AdminProductListBloc>().add(
                AdminProductListEvent.loadAdminProductList(),
              );
            }
          }

          Navigator.pop(context);
        },
      ),
      body: _screens[_selectedIndex],
      floatingActionButton:
          _selectedIndex ==
              1 // Only show FAB on Products screen
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenAddProduct(isEdit: false),
                  ),
                ).then((value) {
                  if (context.mounted) {
                    context.read<AdminProductListBloc>().add(
                      AdminProductListEvent.loadAdminProductList(),
                    );
                  }
                });
              },
              label: const Text('Add Product'),
              icon: const Icon(Icons.add),
            )
          : null,
    );
  }
}
