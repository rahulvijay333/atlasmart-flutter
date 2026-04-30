import 'package:atlasmart/application/admin/admin_list/admin_list_bloc.dart';
import 'package:atlasmart/application/admin/admin_product_list/admin_product_list_bloc.dart';
import 'package:atlasmart/application/admin/category_list/category_list_bloc.dart';
import 'package:atlasmart/presentation/admin/category/screen_categories.dart';
import 'package:atlasmart/presentation/admin/category/screen_add_category.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/admin/admin_order_list/admin_order_list_bloc.dart';
import '../../../application/admin/admin_payments_list/admin_payment_list_bloc.dart';
import '../../../application/admin/inventory/inventory_bloc.dart';
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
    const ScreenCategories(),
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
        return AppStrings.categories;
      case 3:
        return AppStrings.inventory;
      case 4:
        return AppStrings.orders;
      case 5:
        return AppStrings.payments;
      case 6:
        return AppStrings.users;
      case 7:
        return AppStrings.pushNotifications;
      case 8:
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
          setState(() {
            _selectedIndex = index;
          });
          if (index == 6) {
            BlocProvider.of<AllUsersBloc>(
              context,
            ).add(AllUsersEvent.getAllUsers());
          }

          if (index == 5) {
            context.read<AdminPaymentListBloc>().add(LoadAllPayments());
          }

          if (index == 8) {
            context.read<AdminListBloc>().add(AdminListEvent.getAllAdminList());
          }

          if (index == 1) {
            context.read<AdminProductListBloc>().add(
              AdminProductListEvent.loadAdminProductList(),
            );
          }

          if (index == 3) {
            context.read<InventoryBloc>().add(
              const InventoryEvent.loadInventory(),
            );
          }

          if (index == 2) {
            context.read<CategoryListBloc>().add(
              const CategoryListEvent.getAllCategoryList(),
            );
          }

          if (index == 4) {
            context.read<AdminOrderListBloc>().add(LoadingAdminOrders());
          }

          Navigator.pop(context);
        },
        role: widget.role,
      ),
      body: _screens[_selectedIndex],
      floatingActionButton: _selectedIndex == 1 || _selectedIndex == 2
          ? FloatingActionButton.extended(
              onPressed: () {
                if (_selectedIndex == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ScreenAddProduct(isEdit: false),
                    ),
                  ).then((value) {
                    if (context.mounted) {
                      context.read<AdminProductListBloc>().add(
                        AdminProductListEvent.loadAdminProductList(),
                      );
                    }
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenAddCategory(),
                    ),
                  ).then((value) {
                    if (value == true && context.mounted) {
                      context.read<CategoryListBloc>().add(
                        const CategoryListEvent.getAllCategoryList(),
                      );
                    }
                  });
                }
              },
              label: Text(_selectedIndex == 1 ? 'Add Product' : 'Add Category'),
              icon: const Icon(Icons.add),
            )
          : null,
    );
  }
}
