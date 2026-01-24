import 'package:atlasmart/application/admin/users/all_users_bloc.dart';
import 'package:atlasmart/presentation/admin/users/screen_user_details.dart';
import 'package:atlasmart/presentation/common/error_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../common/admin_search_bar.dart';
import '../../../domain/core/constants/strings.dart';

class ScreenAdminUsers extends StatelessWidget {
  const ScreenAdminUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<AllUsersBloc>(context).add(AllUsersEvent.getAllUsers());
      },
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const AdminSearchBar(hintText: AppStrings.searchUsersHint),
            ),
            BlocBuilder<AllUsersBloc, AllUsersState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return SizedBox();
                  },
                  loading: () {
                    return Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  failure: (message) {
                    return Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(message),
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<AllUsersBloc>(
                                  context,
                                ).add(AllUsersEvent.getAllUsers());
                              },
                              icon: Icon(Icons.refresh),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  success: (users) {
                    if (users.isEmpty) {
                      return ErrorStateWidgetWithMessage(
                        'No Users',
                        hasRefresh: true,
                        ontap: () {
                          BlocProvider.of<AllUsersBloc>(
                            context,
                          ).add(AllUsersEvent.getAllUsers());
                        },
                      );
                    }

                    return Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        itemCount: users.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final user = users[index];
                          final isActive = index % 3 != 0;
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ScreenUserDetails(user);
                                  },
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          user.userImage?.isNotEmpty == true
                                          ? NetworkImage(user.userImage!)
                                          : null,
                                      radius: 24,
                                      backgroundColor: Theme.of(
                                        context,
                                      ).primaryColor.withValues(alpha: 0.1),
                                      child: user.userImage?.isNotEmpty == true
                                          ? null
                                          : Text(
                                              user.userName.isNotEmpty
                                                  ? user.userName[0]
                                                  : '-',
                                              style: TextStyle(
                                                color: Theme.of(
                                                  context,
                                                ).primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            user.userName,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            user.userEmail,
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Joined on ${DateFormat('dd MMM yyy ').format(user.joinedDate!.toLocal())}',
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Column(
                                    //   crossAxisAlignment: CrossAxisAlignment.end,
                                    //   children: [
                                    //     Container(
                                    //       padding: const EdgeInsets.symmetric(
                                    //         horizontal: 8,
                                    //         vertical: 4,
                                    //       ),
                                    //       decoration: BoxDecoration(
                                    //         color: isActive
                                    //             ? Colors.green.withValues(
                                    //                 alpha: 0.1,
                                    //               )
                                    //             : Colors.red.withValues(alpha: 0.1),
                                    //         borderRadius: BorderRadius.circular(8),
                                    //       ),
                                    //       child: Text(
                                    //         isActive
                                    //             ? AppStrings.active
                                    //             : AppStrings.blocked,
                                    //         style: TextStyle(
                                    //           color: isActive
                                    //               ? Colors.green
                                    //               : Colors.red,
                                    //           fontSize: 11,
                                    //           fontWeight: FontWeight.bold,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     const SizedBox(height: 8),
                                    //     Icon(
                                    //       Icons.more_horiz,
                                    //       color: Colors.grey[400],
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
