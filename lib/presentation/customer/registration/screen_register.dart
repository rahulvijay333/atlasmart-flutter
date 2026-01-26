import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:atlasmart/domain/core/constants/strings.dart';
import 'package:atlasmart/domain/registration/model/customer_register_model.dart';
import 'package:atlasmart/presentation/customer/registration/screen_otp_verify.dart';
import 'package:atlasmart/presentation/customer/registration/screen_register_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/registration/customer/custom_registr_bloc/customer_register_bloc.dart';
import '../../../domain/core/constants/colors.dart';
import '../../../domain/core/constants/image.dart';
import '../../common/button_widget.dart';
import '../../common/snack_bar.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  handleRegister() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      final customer = CustomerRegisterModel(
        fullName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      BlocProvider.of<CustomerRegisterBloc>(
        context,
      ).add(CustomerRegisterEvent.createAccount(customer: customer));
    } else {
      AppSnackBar.show(context, 'Fill all values');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(AppImage.appLogo, height: 250)),

              Text(
                AppStrings.createYourAccount,
                style: AppFont.subHeading16BoldStyle,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.fullName),

                  TextFormField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintStyle: AppFont.hintText14StyleGreyColor,
                      border: InputBorder.none,
                      hintText: AppStrings.fullNameHint,
                    ),
                  ),
                  Text(AppStrings.email),

                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintStyle: AppFont.hintText14StyleGreyColor,
                      border: InputBorder.none,
                      hintText: AppStrings.emailHint,
                    ),
                  ),

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
                  SizedBox(height: 15),
                  BlocConsumer<CustomerRegisterBloc, CustomerRegisterState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        sendOtp: (customer) {
                          BlocProvider.of<CustomerRegisterBloc>(context).add(
                            CustomerRegisterEvent.sendOtp(
                              customer: customer,
                              resendOtp: false,
                            ),
                          );

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ScreenOtpVerify(customer: customer),
                            ),
                          );
                        },

                        success: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ScreenRegisterSuccess(),
                            ),
                          );
                        },
                        failure: (message) {
                          AppSnackBar.show(context, message);
                        },
                      );
                    },
                    builder: (context, state) {
                      return ButtonWidget(
                        isloading: state == CustomerRegisterState.loading()
                            ? true
                            : false,
                        height: 50,
                        title: AppStrings.createAccount,
                        ontap: state != CustomerRegisterState.loading()
                            ? handleRegister
                            : () {},
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.alreadyHaveAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppStrings.login,
                      style: AppFont.title14BoldStyleOrangeColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
