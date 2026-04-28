import 'package:atlasmart/application/profile_admin_customer/admin/bloc/admin_profile_bloc.dart';
import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/admin/dashboard/admin_dashboard_bloc.dart';
import '../../../domain/core/constants/strings.dart';
import 'widgets/dashboard_stats_card.dart';

class ScreenAdminDashboard extends StatefulWidget {
  const ScreenAdminDashboard({super.key});

  @override
  State<ScreenAdminDashboard> createState() => _ScreenAdminDashboardState();
}

class _ScreenAdminDashboardState extends State<ScreenAdminDashboard> {
  @override
  void initState() {
    super.initState();
    context.read<AdminDashboardBloc>().add(LoadAdminDashboard());
  }

  /// Responsive: 2 cols < 600, 3 cols < 960, 4 cols >= 960
  static int _statsCrossAxisCount(double width) {
    if (width < 600) return 2;
    if (width < 960) return 3;
    return 4;
  }

  /// Responsive padding
  static double _padding(double width) {
    if (width < 600) return 16;
    if (width < 960) return 24;
    return 32;
  }

  static const double _maxContentWidth = 1280;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final padding = _padding(width);
    final crossAxisCount = _statsCrossAxisCount(width);

    return RefreshIndicator(
      onRefresh: () async {
        context.read<AdminProfileBloc>().add(
          AdminProfileEvent.getProfileDetails(),
        );
        context.read<AdminDashboardBloc>().add(LoadAdminDashboard());
      },
      child: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxContentWidth),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  SizedBox(height: padding * 1.5),
                  _buildStatsGrid(context, crossAxisCount),
                  SizedBox(height: padding * 1.5),
                  // _buildRecentOrders(context, width),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<AdminProfileBloc, AdminProfileState>(
      builder: (context, state) {
        String userName = '';
        state.whenOrNull(success: (profile) => userName = profile.userName);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${AppStrings.welcomeBackAdmin} $userName',
              style:
                  theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ) ??
                  AppFont.subHeading16BoldStyle,
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.notifications_outlined),
            //   style: IconButton.styleFrom(
            //     backgroundColor: theme.colorScheme.surfaceContainerHighest,
            //   ),
            // ),
          ],
        );
      },
    );
  }

  Widget _buildStatsGrid(BuildContext context, int crossAxisCount) {
    return BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
      builder: (context, state) {
        if (state.isloading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state.error != null) {
          return Center(
            child: Column(
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 8),
                Text('Error: ${state.error}'),
                TextButton(
                  onPressed: () {
                    context.read<AdminDashboardBloc>().add(
                      LoadAdminDashboard(),
                    );
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final dash = state.dashboard;

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.4,
          children: [
            DashboardStatsCard(
              title: AppStrings.revenue,
              value: dash?.totalRevenue ?? '₹0',
              icon: Icons.currency_rupee,
              color: Colors.green,
            ),
            DashboardStatsCard(
              title: AppStrings.totalOrders,
              value: dash?.orderCount.toString() ?? '0',
              icon: Icons.shopping_cart_outlined,
              color: Colors.blue,
            ),
            DashboardStatsCard(
              title: AppStrings.newUsers,
              value: dash?.userCount.toString() ?? '0',
              icon: Icons.person_add_outlined,
              color: Colors.orange,
            ),
            DashboardStatsCard(
              title: AppStrings.products,
              value: dash?.productsCount.toString() ?? '0',
              icon: Icons.inventory_2_outlined,
              color: Colors.purple,
            ),
          ],
        );
      },
    );
  }
}
