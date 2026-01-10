import 'package:atlasmart/application/profile/customer/customer_profile_bloc.dart';
import 'package:atlasmart/domain/core/constants/colors.dart';
import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:atlasmart/domain/profile/model/profile_model.dart';
import 'package:atlasmart/presentation/common/button_widget.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenEditProfile extends StatefulWidget {
  const ScreenEditProfile({super.key, required this.profile});

  final ProfileModel profile;

  @override
  State<ScreenEditProfile> createState() => _ScreenEditProfileState();
}

class _ScreenEditProfileState extends State<ScreenEditProfile> {
  final TextEditingController namecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool editProfile = false;

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

      body: BlocListener<CustomerProfileBloc, CustomerProfileState>(
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
                      }
                    },
                  ),
                  Spacer(),
                  if (editProfile == true)
                    BlocBuilder<CustomerProfileBloc, CustomerProfileState>(
                      builder: (context, state) {
                        return ButtonWidget(
                          isloading:
                              state == CustomerProfileState.updateLoading()
                              ? true
                              : false,
                          title: 'Save',
                          height: 50,
                          ontap: () {
                            if (_formkey.currentState!.validate()) {
                              BlocProvider.of<CustomerProfileBloc>(context).add(
                                CustomerProfileEvent.updateProfileDetailsButtonClick(
                                  profile: widget.profile.copyWith(
                                    userName: namecontroller.text.trim(),
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
