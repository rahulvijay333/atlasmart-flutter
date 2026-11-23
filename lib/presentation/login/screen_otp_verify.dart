import 'package:atlasmart/domain/core/constants/colors.dart';
import 'package:atlasmart/infrastructure/login/model/user_details/user_details.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../application/login/login_bloc.dart';
import '../../domain/core/constants/constants.dart';
import '../../domain/core/constants/font.dart';
import '../admin/main/screen_admin_main.dart';
import '../common/button_widget.dart';
import '../common/pincode_theme.dart';
import '../customer/main/screen_main.dart';

class ScreenOtpVerify extends StatefulWidget {
  const ScreenOtpVerify(this.user, {super.key});

  final UserDetails user;

  @override
  State<ScreenOtpVerify> createState() => _ScreenOtpVerifyState();
}

class _ScreenOtpVerifyState extends State<ScreenOtpVerify> {
  final _otpController = PinInputController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(title: Text('Verification Pending')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            state.whenOrNull(
              verifyOtpSendFailed: (message) {
                AppSnackBar.show(context, message);
              },

              failure: (message) {
                AppSnackBar.show(context, message);
              },

              success: (state) {
                switch (state.role) {
                  case AppConstants.admin:
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => ScreenAdminMain(role: state.role),
                      ),
                      (route) => false,
                    );
                    break;
                  case AppConstants.customer:
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => ScreenMain()),
                      (route) => false,
                    );

                    break;
                  default:
                }
              },
            );
          },
          builder: (context, state) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ?state.whenOrNull(
                    notverified: (user) {
                      return EmailNotVerifiedWidget(
                        widget: widget,
                        state: state,
                      );
                    },
                    verifyOtpSentLoading: () =>
                        EmailNotVerifiedWidget(widget: widget, state: state),
                    verifyOtpSendFailed: (message) =>
                        EmailNotVerifiedWidget(widget: widget, state: state),
                    verifyOtpSentSuccess: (_) => VerifyOtpWidget(
                      widget: widget,
                      otpController: _otpController,
                    ),
                    failure: (message) => VerifyOtpWidget(
                      widget: widget,
                      otpController: _otpController,
                    ),
                    verifyingAccount: () => VerifyOtpWidget(
                      widget: widget,
                      otpController: _otpController,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class EmailNotVerifiedWidget extends StatelessWidget {
  const EmailNotVerifiedWidget({
    super.key,
    required this.widget,
    required this.state,
  });

  final ScreenOtpVerify widget;
  final LoginState state;

  @override
  Widget build(BuildContext context) {
    final isLoading = state.maybeWhen(
      verifyOtpSentLoading: () => true,
      orElse: () => false,
    );
    return Column(
      spacing: 25,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withValues(alpha: 0.1),
                blurRadius: 60,
                spreadRadius: 15,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Image.asset('assets/account_not veridied.jpg', height: 200),
          ),
        ),
        Text(
          'Email not verified !!!',
          style: AppFont.title18Style.copyWith(fontWeight: FontWeight.bold),
        ),
        ButtonWidget(
          isloading: isLoading,
          height: 50,
          title: 'Send Otp',
          ontap: () {
            if (widget.user.data?.user?.email?.isNotEmpty == true) {
              context.read<LoginBloc>().add(
                LoginEvent.sendOtpButtonClick(
                  email: widget.user.data?.user?.email ?? '',
                ),
              );
            } else {
              AppSnackBar.show(context, 'Some issue happend, try later');
            }
          },
        ),
      ],
    );
  }
}

class VerifyOtpWidget extends StatelessWidget {
  const VerifyOtpWidget({
    super.key,
    required this.widget,
    required PinInputController otpController,
  }) : _otpController = otpController;

  final ScreenOtpVerify widget;
  final PinInputController _otpController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withValues(alpha: 0.1),
                blurRadius: 60,
                spreadRadius: 15,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Image.asset('assets/verify_otp.jpg', height: 200),
          ),
        ),
        Text('Verify OTP', style: AppFont.subHeading16BoldStyle),
        const SizedBox(height: 10),

        Text(
          'OTP sent to ${widget.user.data?.user?.email ?? ''}',
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 30),

        MaterialPinField(
          length: 6,
          pinController: _otpController,
          theme: AppPinTheme.otp(context),
          onCompleted: (otp) {
            // OTP completion logic
          },
        ),

        const SizedBox(height: 30),

        BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ButtonWidget(
              isloading: state == LoginState.verifyingAccount() ? true : false,
              height: 50,
              title: 'Verify OTP',
              ontap: () {
                if (_otpController.text.isNotEmpty &&
                    widget.user.data?.user?.email?.isNotEmpty == true) {
                  context.read<LoginBloc>().add(
                    LoginEvent.verifyAccountButtonClick(
                      otp: _otpController.text,
                      email: widget.user.data?.user?.email ?? '',
                    ),
                  );
                } else {
                  AppSnackBar.show(context, 'Some issue happend, try later');
                }
              },
            );
          },
        ),
      ],
    );
  }
}
