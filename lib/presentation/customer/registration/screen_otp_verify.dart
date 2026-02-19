import 'dart:async';

import 'package:atlasmart/application/registration/customer/custom_registr_bloc/customer_register_bloc.dart';
import 'package:atlasmart/domain/core/constants/colors.dart';
import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:atlasmart/presentation/common/snack_bar.dart';
import 'package:atlasmart/presentation/customer/registration/screen_register_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../domain/core/constants/image.dart';

import '../../../domain/registration/model/customer_register_model.dart';
import '../../common/app_dialoge.dart';
import '../../common/button_widget.dart';

class ScreenOtpVerify extends StatefulWidget {
  const ScreenOtpVerify({super.key, required this.customer});
  final CustomerRegisterModel customer;

  @override
  State<ScreenOtpVerify> createState() => _ScreenOtpVerifyState();
}

class _ScreenOtpVerifyState extends State<ScreenOtpVerify> {
  final TextEditingController textEditingController = TextEditingController();

  static const int _initialSeconds = 60;
  int _secondsRemaining = _initialSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = _initialSeconds;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        // Schedule AFTER pop cycle finishes
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          final shouldExit = await AppDialog.showConfirmation(
            context,
            title: 'Verify OTP',
            description: 'Do you want to cancel account verification process?',
            positiveText: 'Yes',
            negativeText: 'No',
          );

          if (shouldExit == true && context.mounted) {
            Navigator.of(context).pop();
          }
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Verify OTP', style: AppFont.appBar18Style),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocConsumer<CustomerRegisterBloc, CustomerRegisterState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return ScreenRegisterSuccess();
                        },
                      ),
                    );
                  },

                  sendOtpFailed: (message, state) {
                    AppSnackBar.show(context, message);
                  },

                  failure: (message) {
                    AppSnackBar.show(context, message);
                  },
                );
              },
              builder: (context, state) {
                return Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ?state.whenOrNull(
                          sendOtpLoading: () => SizedBox(
                            height: 350,
                            width: double.infinity,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                  
                          sendOtpFailed: (message, customer) {
                            return Column(
                              children: [
                                Text('Account create process failed'),
                                IconButton(
                                  onPressed: () {
                                    BlocProvider.of<CustomerRegisterBloc>(
                                      context,
                                    ).add(
                                      CustomerRegisterEvent.sendOtp(
                                        customer: customer,
                                        resendOtp: false,
                                      ),
                                    );
                                  },
                                  icon: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Retry',
                                        style: AppFont.title14Style.copyWith(
                                          color: AppColors.amberColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.refresh,
                                        color: AppColors.amberColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                  
                          verifyOtp: (customer) {
                            return VerifyOtpWidget(
                              customer: customer,
                              textEditingController: textEditingController,
                              secondsRemaining: _secondsRemaining,
                              onResendOtp: () {
                                BlocProvider.of<CustomerRegisterBloc>(
                                  context,
                                ).add(
                                  CustomerRegisterEvent.sendOtp(
                                    customer: customer,
                                    resendOtp: true,
                                  ),
                                );
                                _startTimer();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyOtpWidget extends StatelessWidget {
  const VerifyOtpWidget({
    super.key,
    required this.customer,
    required this.textEditingController,
    required this.secondsRemaining,
    required this.onResendOtp,
  });

  final CustomerRegisterModel customer;
  final TextEditingController textEditingController;
  final int secondsRemaining;
  final VoidCallback onResendOtp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),

        /// Logo
        Image.asset(AppImage.appLogo, height: 90),
        const SizedBox(height: 24),

        /// Title
        Text(
          'OTP Verification',
          style: AppFont.title18Style.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        /// Subtitle
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppFont.title14Style.copyWith(color: Colors.grey.shade600),
            children: [
              TextSpan(text: 'Enter the 6-digit code sent to\n'),
              TextSpan(
                text: customer.email,
                style: AppFont.title14Style.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),

        /// OTP Field
        PinCodeTextField(
          appContext: context,
          length: 6,
          controller: textEditingController,
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          enableActiveFill: true,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(12),
            fieldHeight: 52,
            fieldWidth: 46,
            inactiveColor: Colors.grey.shade300,
            inactiveFillColor: Colors.grey.shade100,
            activeColor: Theme.of(context).primaryColor,
            activeFillColor: Colors.white,
            selectedColor: Theme.of(context).primaryColor,
            selectedFillColor: Colors.white,
          ),

          onCompleted: (value) {
            debugPrint("OTP Completed: $value");
          },
          onChanged: (value) {},
        ),

        const SizedBox(height: 40),

        /// Verify Button
        BlocBuilder<CustomerRegisterBloc, CustomerRegisterState>(
          builder: (context, state) {
            return ButtonWidget(
              isloading: state == CustomerRegisterState.verifyOtpLoading()
                  ? true
                  : false,
              height: 50,

              title: 'Verify OTP',
              ontap: state != CustomerRegisterState.verifyOtpLoading()
                  ? () {
                      if (textEditingController.text.length == 6) {
                        final user = customer.copyWith(
                          otp: textEditingController.text,
                        );
                        BlocProvider.of<CustomerRegisterBloc>(context).add(
                          CustomerRegisterEvent.verifyOtpButtonClick(
                            customer: user,
                          ),
                        );
                      } else {
                        AppSnackBar.show(context, 'Invalid OTP');
                      }
                    }
                  : () {},
            );
          },
        ),
        const SizedBox(height: 20),

        /// Resend OTP
        TextButton(
          onPressed: secondsRemaining == 0 ? onResendOtp : null,
          child: Text(
            secondsRemaining == 0
                ? "Resend OTP"
                : "Resend OTP in $secondsRemaining s",
            style: AppFont.title14Style.copyWith(
              color: secondsRemaining == 0
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
          ),
        ),

        // const SizedBox(height: 40),
      ],
    );
  }
}
