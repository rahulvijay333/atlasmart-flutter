import 'package:atlasmart/domain/constants/constants.dart';
import 'package:atlasmart/presentation/common/button_widget.dart';
import 'package:atlasmart/presentation/login/screen_login.dart';
import 'package:flutter/material.dart';

import '../../../domain/constants/strings.dart';
import 'widgets/list_tile_widget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          title: Text(AppStrings.profile,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.person, size: 60, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Person Name',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'test@gmail.com',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildSectionCard(
                context,
                title: AppStrings.myAccount,
                children: [
                  ListTileWidget(title: AppStrings.editProfile, ontap: () {}),
                  ListTileWidget(title: AppStrings.shippingAddress, ontap: () {}),
                ],
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                context,
                title: AppStrings.myOrders,
                children: [
                  ListTileWidget(title: AppStrings.orderHistory, ontap: () {}),
                ],
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                context,
                title: AppStrings.settings,
                children: [
                  ListTileWidget(title: AppStrings.appSettings, ontap: () {}),
                  ListTileWidget(title: AppStrings.helpAndSupport, ontap: () {}),
                ],
              ),
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: Text(
                '${AppStrings.appVersion} ${AppConstants.appVersion}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
          sliver: SliverToBoxAdapter(
            child: ButtonWidget(
              title: AppStrings.logout,
              height: 50,
              ontap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) {
                      return ScreenLogin();
                    },
                  ),
                  (route) => false,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard(BuildContext context,
      {required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade200)),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
