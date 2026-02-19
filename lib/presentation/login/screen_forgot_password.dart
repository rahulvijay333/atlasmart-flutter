import 'package:atlasmart/application/forgot_password/forgot_password_bloc.dart';
import 'package:atlasmart/domain/core/constants/colors.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:atlasmart/presentation/login/screen_password_reset_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../domain/core/constants/font.dart';
import '../../domain/core/constants/image.dart';
import '../common/button_widget.dart';
import '../common/pincode_theme.dart';

class ScreenForgotPassword extends StatefulWidget {
  const ScreenForgotPassword({super.key});

  @override
  State<ScreenForgotPassword> createState() => _ScreenForgotPasswordState();
}

class _ScreenForgotPasswordState extends State<ScreenForgotPassword> {
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('Forgot Password', style: AppFont.appBar18Style),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            state.whenOrNull(
              verifyOtpFailed: (message) {
                AppSnackBar.show(context, message);
              },
              sentEmailOtpFailed: (message) {
                AppSnackBar.show(context, message);
              },
              setPasswordfailed: (message) {
                AppSnackBar.show(context, message);
              },
              success: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ScreenForgotPasswordSuccess(),
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Column(
                    children: [
                      Image.asset(AppImage.appLogo, height: 180),
                      const SizedBox(height: 20),
                  
                      /// 🔥 SWITCH UI BASED ON STATE
                      ?state.whenOrNull(
                        initial: () => _buildEnterEmail(state),
                        enterEmail: () => _buildEnterEmail(state),
                        sentEmailOtpLoading: () => _buildEnterEmail(state),
                        sentEmailOtpFailed: (message) => _buildEnterEmail(state),
                        verifyOtp: () => _buildVerifyOtp(state),
                        verifyOtpLoading: () => _buildVerifyOtp(state),
                        verifyOtpFailed: (message) => _buildVerifyOtp(state),
                        setPassword: () => _buildSetPassword(state),
                        setPasswordLoading: () => _buildSetPassword(state),
                        setPasswordfailed: (message) => _buildSetPassword(state),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEnterEmail(ForgotPasswordState state) {
    final isLoading = state.maybeWhen(
      sentEmailOtpLoading: () => true,
      orElse: () => false,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Enter Registered Email', style: AppFont.subHeading16BoldStyle),
        const SizedBox(height: 20),

        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(hintText: 'Enter your email'),
        ),

        const SizedBox(height: 30),

        ButtonWidget(
          isloading: isLoading,
          height: 50,
          title: 'Next',
          ontap: () {
            context.read<ForgotPasswordBloc>().add(
              ForgotPasswordEvent.sentEmailOtp(email: _emailController.text),
            );
          },
        ),
      ],
    );
  }

  Widget _buildVerifyOtp(ForgotPasswordState state) {
    final isLoading = state.maybeWhen(
      verifyOtpLoading: () => true,
      orElse: () => false,
    );
    return Column(
      children: [
        Text('Verify OTP', style: AppFont.subHeading16BoldStyle),
        const SizedBox(height: 10),

        Text(
          'OTP sent to ${_emailController.text}',
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 30),

        PinCodeTextField(
          appContext: context,
          autoDisposeControllers: false,
          length: 6,
          pinTheme: AppPinTheme.otp(context),
          controller: _otpController,
          onCompleted: (otp) {
            // context.read<ForgotPasswordBloc>().add(
            //       ForgotPasswordEvent.verifyOtp(otp: otp),
            //     );
          },
        ),

        const SizedBox(height: 30),

        ButtonWidget(
          isloading: isLoading,
          height: 50,
          title: 'Verify',
          ontap: () {
            context.read<ForgotPasswordBloc>().add(
              ForgotPasswordEvent.verifyOtpButtonClick(
                otp: _otpController.text,
                email: _emailController.text,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSetPassword(ForgotPasswordState state) {
    final isLoading = state.maybeWhen(
      setPasswordLoading: () => true,
      orElse: () => false,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Set New Password', style: AppFont.subHeading16BoldStyle),
        const SizedBox(height: 20),

        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(hintText: 'New Password'),
        ),

        const SizedBox(height: 15),

        TextFormField(
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: const InputDecoration(hintText: 'Confirm Password'),
        ),

        const SizedBox(height: 30),

        ButtonWidget(
          isloading: isLoading,
          height: 50,
          title: 'Set Password',
          ontap: state != ForgotPasswordState.setPasswordLoading()
              ? () {
                  if (_confirmPasswordController.text ==
                      _passwordController.text) {
                    context.read<ForgotPasswordBloc>().add(
                      ForgotPasswordEvent.setPasswordButtonClick(
                        email: _emailController.text,
                        otp: _otpController.text,
                        password: _confirmPasswordController.text,
                      ),
                    );
                  } else {
                    AppSnackBar.show(context, 'Passwords doesnt match');
                  }
                }
              : () {},
        ),
      ],
    );
  }
}
// class ScreenForgotPassword extends StatefulWidget {
//   const ScreenForgotPassword({super.key});

//   @override
//   State<ScreenForgotPassword> createState() => _ScreenForgotPasswordState();
// }

// class _ScreenForgotPasswordState extends State<ScreenForgotPassword> {
//   final _passwordController = TextEditingController();

//   final _confirmPasswordController = TextEditingController();

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   handleSetPassword() {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(child: Image.asset(AppImage.appLogo, height: 250)),

//               Text(
//                 'Forgot Password',
//                 style: AppFont.subHeading16BoldStyle,
//                 textAlign: TextAlign.center,
//               ),

//               SizedBox(height: 30),
//               Column(
//                 spacing: 10,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(AppStrings.password),

//                   TextFormField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(5),
//                       hintStyle: AppFont.hintText14StyleGreyColor,
//                       border: InputBorder.none,
//                       hintText: AppStrings.passwordHint,
//                     ),
//                   ),

//                   Text('Confirm Password'),

//                   TextFormField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(5),
//                       hintStyle: AppFont.hintText14StyleGreyColor,
//                       border: InputBorder.none,
//                       hintText: AppStrings.passwordHint,
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
//                     listener: (context, state) {
//                       state.whenOrNull(
//                         initial: () {},
//                         enterEmail: () {},
//                         sentEmailOtpLoading: () {},
//                         setPassword: () {},
//                         setPasswordLoading: () {},
//                         verifyOtpLoading: () {},
//                         verifyOtp: () {},
//                         success: () {
//                           // Navigator.of(context).pushReplacement(
//                           //   MaterialPageRoute(
//                           //     builder: (context) => ScreenRegisterSuccess(),
//                           //   ),
//                           // );
//                         },
//                         failure: (message) {
//                           ScaffoldMessenger.of(
//                             context,
//                           ).showSnackBar(SnackBar(content: Text(message)));
//                         },
//                       );
//                     },
//                     builder: (context, state) {
//                       return ButtonWidget(
//                         isloading: false,
//                         height: 50,
//                         title: AppStrings.createAccount,
//                         ontap: () {},
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 25),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
