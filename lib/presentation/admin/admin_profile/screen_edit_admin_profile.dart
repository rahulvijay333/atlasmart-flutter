import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/profile_admin_customer/admin/bloc/admin_profile_bloc.dart';
import '../../../domain/admin/profile/model/admin_profile.dart';
import '../../../domain/core/constants/colors.dart';
import '../../../domain/core/constants/font.dart';
import '../../../domain/core/util/image_picker.dart';
import '../../common/button_widget.dart';
import '../../common/snack_bar.dart';

class ScreenEditAdminProfile extends StatefulWidget {
  const ScreenEditAdminProfile({super.key, required this.profile});

  final AdminUserModel profile;

  @override
  State<ScreenEditAdminProfile> createState() => _ScreenEditAdminProfileState();
}

class _ScreenEditAdminProfileState extends State<ScreenEditAdminProfile> {
  final TextEditingController namecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool editProfile = false;
  File? selectedImage;

  @override
  void initState() {
    namecontroller.text = widget.profile.userName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: AppFont.appBar18Style),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                editProfile = !editProfile;
              });
            },
            icon: editProfile
                ? Icon(Icons.cancel, color: AppColors.amberColor)
                : Icon(Icons.edit),
          ),
        ],
      ),

      body: BlocListener<AdminProfileBloc, AdminProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (profile) {
              setState(() {
                editProfile = false;
              });

              if (context.mounted) {
                AppSnackBar.show(context, 'Profile Updated');
              }
            },
            failed: (message) {
              AppSnackBar.show(context, message);
            },
          );
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: AlignmentGeometry.bottomCenter,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: selectedImage != null
                              ? FileImage(selectedImage!)
                              : (widget.profile.userImage != null &&
                                    widget.profile.userImage!.isNotEmpty)
                              ? NetworkImage(widget.profile.userImage!)
                              : null,
                          child:
                              (selectedImage == null &&
                                  (widget.profile.userImage == null ||
                                      widget.profile.userImage!.isEmpty))
                              ? const Icon(Icons.person, size: 60)
                              : null,
                        ),
                        if (editProfile)
                          Positioned(
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                ),
                                onPressed: () async {
                                  final image = await ImagePickerUtil.pickImage(
                                    context,
                                  );
                                  if (image != null) {
                                    setState(() => selectedImage = image);
                                  }
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    'Name',
                    style: AppFont.title16Style.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: namecontroller,
                    readOnly: !editProfile,
                    maxLength: 80,
                    buildCounter:
                        (
                          context, {
                          required currentLength,
                          required isFocused,
                          required maxLength,
                        }) => null,
                    textCapitalization: TextCapitalization.sentences,
                    style: AppFont.title16Style.copyWith(
                      color: editProfile ? null : Colors.grey,
                    ),
                    decoration: InputDecoration(
                      fillColor: editProfile ? null : Colors.grey.shade50,
                    ),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Spacer(),
                  if (editProfile == true)
                    BlocBuilder<AdminProfileBloc, AdminProfileState>(
                      builder: (context, state) {
                        return ButtonWidget(
                          isloading: state == AdminProfileState.loading()
                              ? true
                              : false,
                          title: 'Save',
                          height: 50,
                          ontap: () {
                            if (_formkey.currentState!.validate()) {
                              BlocProvider.of<AdminProfileBloc>(context).add(
                                AdminProfileEvent.updateProfileDetailsButtonClick(
                                  profile: widget.profile.copyWith(
                                    userName: namecontroller.text.trim(),
                                    newProfileImage: selectedImage,
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
