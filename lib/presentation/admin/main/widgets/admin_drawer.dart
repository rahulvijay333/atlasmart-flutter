import 'package:atlasmart/application/profile_admin_customer/admin/bloc/admin_profile_bloc.dart';
import 'package:atlasmart/domain/core/constants/colors.dart';
import 'package:atlasmart/domain/core/constants/constants.dart';
import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:atlasmart/presentation/admin/admin_profile/screen_admin_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/login/login_bloc.dart';
import '../../../common/snack_bar.dart';
import '../../../login/screen_login.dart';
import '../../../../domain/core/constants/strings.dart';

class AdminDrawerWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final String role;

  AdminDrawerWidget({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.role,
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
            padding: const EdgeInsets.fromLTRB(10, 60, 10, 24),
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
            child: BlocBuilder<AdminProfileBloc, AdminProfileState>(
              builder: (context, state) {
                return Row(
                  spacing: 5,
                  children: [
                    ?state.whenOrNull(
                      success: (profile) {
                        return Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage:
                                profile.userImage?.isNotEmpty == true
                                ? NetworkImage(profile.userImage!)
                                : null,
                            backgroundColor:
                                profile.userImage?.isEmpty == true ||
                                    profile.userImage == null
                                ? Colors.white
                                : null,
                            child:
                                profile.userImage?.isEmpty == true ||
                                    profile.userImage == null
                                ? Icon(
                                    Icons.person,
                                    color: Colors.orange,
                                    size: 30,
                                  )
                                : null,
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: BlocBuilder<AdminProfileBloc, AdminProfileState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              ?state.whenOrNull(
                                loading: () {
                                  return Center(
                                    child: SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                },

                                failed: (message) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Retry',
                                          style: AppFont
                                              .title14BoldStyleWhiteColor,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            BlocProvider.of<AdminProfileBloc>(
                                              context,
                                            ).add(
                                              AdminProfileEvent.getProfileDetails(),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.refresh,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                success: (profile) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              profile.userName,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppFont.title16Style
                                                  .copyWith(
                                                    color: AppColors.whiteColor,
                                                  ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              profile.brandName ??
                                                  profile.userEmail,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppFont.title14Style
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1,
                                                    color: AppColors.whiteColor,
                                                  ),
                                              maxLines: 2,
                                            ),
                                            if (profile
                                                    .companyName
                                                    ?.isNotEmpty ==
                                                true)
                                              Text(
                                                profile.companyName!,

                                                overflow: TextOverflow.ellipsis,
                                                style: AppFont.title12Style
                                                    .copyWith(
                                                      letterSpacing: 1,
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                maxLines: 1,
                                              ),
                                          ],
                                        ),
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return ScreenAdminProfile();
                                                  },
                                                ),
                                              )
                                              .then((value) {
                                                if (context.mounted) {
                                                  Navigator.of(context).pop();
                                                }
                                              });
                                        },
                                        icon: Icon(Icons.arrow_forward_ios),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
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
                  isSelected: selectedIndex == 3,
                  onTap: () => onDestinationSelected(3),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.list_alt,
                  selectedIcon: Icons.list_alt,
                  title: AppStrings.orders,
                  isSelected: selectedIndex == 4,
                  onTap: () => onDestinationSelected(4),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.payment_outlined,
                  selectedIcon: Icons.payment,
                  title: AppStrings.payments,
                  isSelected: selectedIndex == 5,
                  onTap: () => onDestinationSelected(5),
                ),
                if (role == AppConstants.superUser) ...[
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.category_outlined,
                    selectedIcon: Icons.category,
                    title: AppStrings.categories,
                    isSelected: selectedIndex == 2,
                    onTap: () => onDestinationSelected(2),
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.people_outline,
                    selectedIcon: Icons.people,
                    title: AppStrings.users,
                    isSelected: selectedIndex == 6,
                    onTap: () => onDestinationSelected(6),
                  ),
                  _buildDrawerItem(
                    context: context,
                    icon: Icons.admin_panel_settings_outlined,
                    selectedIcon: Icons.admin_panel_settings,
                    title: AppStrings.manageAdmins,
                    isSelected: selectedIndex == 8,
                    onTap: () => onDestinationSelected(8),
                  ),
                ],

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Divider(),
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.notifications_none_outlined,
                  selectedIcon: Icons.notifications,
                  title: AppStrings.pushNotifications,
                  isSelected: selectedIndex == 7,
                  onTap: () => onDestinationSelected(7),
                ),
              ],
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                state.whenOrNull(
                  failure: (message) {
                    AppSnackBar.show(context, message);
                  },
                  initial: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) {
                          return ScreenLogin();
                        },
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              builder: (context, state) {
                final isLoading = state == LoginState.loading();
                return _buildDrawerItem(
                  context: context,
                  icon: Icons.logout_rounded,
                  selectedIcon: Icons.logout_rounded,
                  title: AppStrings.logout,
                  isSelected: false,
                  onTap: isLoading
                      ? () {}
                      : () {
                          BlocProvider.of<LoginBloc>(
                            context,
                          ).add(LoginEvent.logOutButtonClick());
                        },
                  isLogout: true,
                  isLoading: isLoading,
                );
              },
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
    bool isLoading = false,
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
        leading: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: color,
                ),
              )
            : Icon(isSelected ? selectedIcon : icon, color: color, size: 24),
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
