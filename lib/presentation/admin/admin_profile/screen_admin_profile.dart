import 'package:atlasmart/application/profile_admin_customer/admin/bloc/admin_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/core/constants/font.dart';
import '../../../domain/core/constants/strings.dart';
import '../../customer/profile/widgets/list_tile_widget.dart';
import 'screen_edit_admin_profile.dart';

class ScreenAdminProfile extends StatelessWidget {
  const ScreenAdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: Text(
              AppStrings.profile,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: BlocBuilder<AdminProfileBloc, AdminProfileState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ?state.whenOrNull(
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                        success: (profile) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      width: 2,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.grey.shade200,
                                    backgroundImage:
                                        profile.userImage?.isNotEmpty == true
                                        ? NetworkImage(profile.userImage!)
                                        : null,
                                    child: profile.userImage?.isEmpty == true
                                        ? Icon(
                                            Icons.person,
                                            size: 60,
                                            color: Colors.grey,
                                          )
                                        : null,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  profile.userName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  profile.userEmail,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          );
                        },

                        failed: (message) {
                          return Center(
                            child: Column(
                              children: [
                                Text(message, style: AppFont.title14Style),

                                IconButton(
                                  onPressed: () {
                                    BlocProvider.of<AdminProfileBloc>(
                                      context,
                                    ).add(
                                      AdminProfileEvent.getProfileDetails(),
                                    );
                                  },
                                  icon: Icon(Icons.refresh),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                BlocBuilder<AdminProfileBloc, AdminProfileState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        ?state.whenOrNull(
                          success: (profile) => _buildSectionCard(
                            context,
                            title: '',
                            children: [
                              ListTileWidget(
                                title: AppStrings.editProfile,
                                ontap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ScreenEditAdminProfile(
                                          profile: profile,
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                // const SizedBox(height: 16),
                // _buildSectionCard(
                //   context,
                //   title: AppStrings.myOrders,
                //   children: [
                //     ListTileWidget(title: AppStrings.orderHistory, ontap: () {}),
                //   ],
                // ),
                // const SizedBox(height: 16),
                // _buildSectionCard(
                //   context,
                //   title: AppStrings.settings,
                //   children: [
                //     ListTileWidget(title: AppStrings.appSettings, ontap: () {}),
                //     ListTileWidget(
                //       title: AppStrings.helpAndSupport,
                //       ontap: () {},
                //     ),
                //   ],
                // ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
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
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}
