import 'package:atlasmart/application/forgot_password/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/core/constants/font.dart';
import '../../../domain/core/constants/image.dart';
import '../../../domain/core/constants/strings.dart';
import '../../common/button_widget.dart';

class ScreenSetPassword extends StatefulWidget {
  const ScreenSetPassword({super.key});

  @override
  State<ScreenSetPassword> createState() => _ScreenSetPasswordState();
}

class _ScreenSetPasswordState extends State<ScreenSetPassword> {
  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  handleSetPassword() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(AppImage.appLogo, height: 250)),

              Text(
                'Set Password',
                style: AppFont.subHeading16BoldStyle,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.password),

                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintStyle: AppFont.hintText14StyleGreyColor,
                      border: InputBorder.none,
                      hintText: AppStrings.passwordHint,
                    ),
                  ),

                  Text('Confirm Password'),

                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintStyle: AppFont.hintText14StyleGreyColor,
                      border: InputBorder.none,
                      hintText: AppStrings.passwordHint,
                    ),
                  ),
                  SizedBox(height: 15),
                  BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                    listener: (context, state) {
                      state.when(
                        initial: () {},
                        loading: () {},
                        setPassword: () {},
                        setPasswordLoading: () {},
                        verifyOtpLoading: () {},
                        verifyOtp: () {},
                        success: () {
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //     builder: (context) => ScreenRegisterSuccess(),
                          //   ),
                          // );
                        },
                        failure: (message) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(message)));
                        },
                      );
                    },
                    builder: (context, state) {
                      return ButtonWidget(
                        isloading: state == ForgotPasswordState.loading()
                            ? true
                            : false,
                        height: 50,
                        title: AppStrings.createAccount,
                        ontap: state != ForgotPasswordState.loading()
                            ? handleSetPassword
                            : () {},
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
