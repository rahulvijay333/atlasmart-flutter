import 'package:atlasmart/application/profile_admin_customer/admin/bloc/admin_profile_bloc.dart';
import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/admin/admin_product_list/admin_product_list_bloc.dart';
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
    context.read<AdminProductListBloc>().add(
          AdminProductListEvent.loadAdminProductList(),
        );
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
        context.read<AdminProfileBloc>().add(AdminProfileEvent.getProfileDetails());
        context.read<AdminProductListBloc>().add(
              AdminProductListEvent.loadAdminProductList(),
            );
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
                  _buildRecentOrders(context, width),
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
        state.whenOrNull(
          success: (profile) => userName = profile.userName,
        );

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${AppStrings.welcomeBackAdmin} $userName',
              style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ) ??
                  AppFont.subHeading16BoldStyle,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
              style: IconButton.styleFrom(
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatsGrid(BuildContext context, int crossAxisCount) {
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
          value: '₹15,430',
          icon: Icons.currency_rupee,
          color: Colors.green,
        ),
        DashboardStatsCard(
          title: AppStrings.totalOrders,
          value: '856',
          icon: Icons.shopping_cart_outlined,
          color: Colors.blue,
        ),
        DashboardStatsCard(
          title: AppStrings.newUsers,
          value: '124',
          icon: Icons.person_add_outlined,
          color: Colors.orange,
        ),
        BlocBuilder<AdminProductListBloc, AdminProductListState>(
          builder: (context, state) {
            String count = '0';
            state.whenOrNull(
              success: (products) => count = products.length.toString(),
            );
            return DashboardStatsCard(
              title: AppStrings.products,
              value: count,
              icon: Icons.inventory_2_outlined,
              color: Colors.purple,
            );
          },
        ),
      ],
    );
  }

  Widget _buildRecentOrders(BuildContext context, double width) {
    final theme = Theme.of(context);
    final useCompactLayout = width >= 700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.recentOrders,
              style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(AppStrings.viewAll),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
            ),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.shadow.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: useCompactLayout
                ? _buildOrdersTable(theme)
                : _buildOrdersList(theme),
          ),
        ),
      ],
    );
  }

  Widget _buildOrdersTable(ThemeData theme) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1.2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(0.8),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          ),
          children: [
            _tableCell(theme, 'Order', isHeader: true),
            _tableCell(theme, 'Details', isHeader: true),
            _tableCell(theme, 'Status', isHeader: true),
          ],
        ),
        ...List.generate(5, (index) {
          return TableRow(
            children: [
              _tableCell(
                theme,
                'OD-${9450 + index}',
                isHeader: false,
              ),
              _tableCell(
                theme,
                '3 Items • ₹${(index + 2) * 1450}',
                isHeader: false,
              ),
              _tableCell(
                theme,
                'Paid',
                isHeader: false,
                isStatus: true,
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _tableCell(
    ThemeData theme,
    String text, {
    required bool isHeader,
    bool isStatus = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: isStatus && !isHeader
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                text,
                style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            )
          : Text(
              text,
              style: isHeader
                  ? theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurfaceVariant,
                      )
                  : theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
            ),
    );
  }

  Widget _buildOrdersList(ThemeData theme) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (_, __) => Divider(
        height: 1,
        color: theme.colorScheme.outline.withValues(alpha: 0.2),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue.withValues(alpha: 0.12),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.blue.shade700, size: 20),
          ),
          title: Text(
            'Order #OD-${9450 + index}',
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            '3 Items • ₹${(index + 2) * 1450}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Paid',
              style: theme.textTheme.labelSmall?.copyWith(
                color: Colors.green.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
