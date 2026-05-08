import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:atlasmart/presentation/common/error_state_widget.dart';
import 'package:atlasmart/presentation/common/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/admin/admin_list/admin_list_bloc.dart';
import '../../../domain/core/constants/strings.dart';
import 'screen_add_admin.dart';

class ScreenManageAdmins extends StatefulWidget {
  const ScreenManageAdmins({super.key});

  @override
  State<ScreenManageAdmins> createState() => _ScreenAddAdminsState();
}

class _ScreenAddAdminsState extends State<ScreenManageAdmins> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminListBloc, AdminListState>(
      builder: (context, state) {
        return Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenAddAdmin(),
                            ),
                          ).then((value) {
                                if (context.mounted) {
                                  context.read<AdminListBloc>().add(
                              AdminListEvent.getAllAdminList(),
                            );
                                }
                          });
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text(AppStrings.addNew),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                ?state.whenOrNull(
                  failure: (message) {
                    return ErrorStateWidgetWithMessage(
                      message,
                      hasRefresh: true,
                      ontap: () {
                        context.read<AdminListBloc>().add(
                          AdminListEvent.getAllAdminList(),
                        );
                      },
                    );
                  },
            
                  loading: () => LoadingWidget(),
                  success: (adminList) {
                    if (adminList.isEmpty) {
                      return ErrorStateWidgetWithMessage(
                        'No admins',
                        hasRefresh: true,
                        ontap: () {
                          context.read<AdminListBloc>().add(
                            AdminListEvent.getAllAdminList(),
                          );
                        },
                      );
                    }
            
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<AdminListBloc>().add(
                            AdminListEvent.getAllAdminList(),
                          );
                        },
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          itemCount: adminList.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final admin = adminList[index];
            
                            return Container(
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
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 26,
                                          backgroundImage:
                                              admin.userImage != null &&
                                                  admin.userImage!.isNotEmpty
                                              ? NetworkImage(admin.userImage!)
                                              : null,
                                          child:
                                              admin.userImage == null ||
                                                  admin.userImage?.isEmpty == true
                                              ? Icon(Icons.person)
                                              : null,
                                        ),
                                        // if (isSuperAdmin)
                                        //   Positioned(
                                        //     bottom: 0,
                                        //     right: 0,
                                        //     child: Container(
                                        //       padding: const EdgeInsets.all(2),
                                        //       decoration: const BoxDecoration(
                                        //         color: Colors.white,
                                        //         shape: BoxShape.circle,
                                        //       ),
                                        //       child: const Icon(
                                        //         Icons.star,
                                        //         color: Colors.orange,
                                        //         size: 14,
                                        //       ),
                                        //     ),
                                        //   ),
                                      ],
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  admin.userName,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            admin.userEmail,
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Center(
                                                child: Text(
                                                  'Confirm',
                                                  style:
                                                      AppFont.subHeading16BoldStyle,
                                                ),
                                              ),
                                              content: Text(
                                                'Are you sure to delete this admin? ',
                                              ),
            
                                              actions: [
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: Text('No'),
                                                ),
            
                                                IconButton(
                                                  onPressed: () {
                                                    context
                                                        .read<AdminListBloc>()
                                                        .add(
                                                          AdminListEvent.deleteAdmin(
                                                            admin.id!,
                                                          ),
                                                        );
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: Text('Yes'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Colors.grey.withValues(alpha: 0.5),
                                      ),
                                    ),
                                    // Switch(
                                    //   value: isActive,
                                    //   onChanged: index == 0
                                    //       ? null
                                    //       : (val) {
                                    //           // Cannot deactive self
                                    //           setState(() {
                                    //             // Toggle Logic mock
                                    //           });
                                    //         },
                                    //   activeTrackColor: Colors.green,
                                    // ),
                                    // IconButton(
                                    //   icon: const Icon(Icons.edit_outlined, size: 20),
                                    //   color: Colors.grey,
                                    //   onPressed: () {},
                                    // ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
