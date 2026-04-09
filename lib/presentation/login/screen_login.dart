import 'package:atlasmart/application/customer/forgot_password/forgot_password_bloc.dart';
import 'package:atlasmart/application/login/login_bloc.dart';
import 'package:atlasmart/domain/core/constants/image.dart';
import 'package:atlasmart/presentation/customer/main/screen_main.dart';
import 'package:atlasmart/presentation/customer/registration/screen_register.dart';
import 'package:atlasmart/presentation/admin/main/screen_admin_main.dart'; // Admin Link
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/profile_admin_customer/admin/bloc/admin_profile_bloc.dart';
import '../../domain/core/constants/constants.dart';
import '../../domain/core/constants/strings.dart';
import '../common/button_widget.dart';
import '../common/snack_bar.dart';
import '../customer/main/widgets/bottom_nav.dart';
import 'screen_forgot_password.dart';
import 'screen_otp_verify.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showpassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      BlocProvider.of<LoginBloc>(
        context,
      ).add(LoginEvent.loginButtonClickEvent(email: email, password: password));
    } else {
      AppSnackBar.show(context, 'Invalid values');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 25,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withValues(alpha: 0.1),
                        blurRadius: 40,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Image.asset(AppImage.appLogo, height: 140),
                ),

                Text(
                  AppStrings.loginScreenMessage,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.email,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: AppStrings.emailHint,
                        ),
                      ),

                      Text(
                        AppStrings.password,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: !showpassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showpassword = !showpassword;
                              });
                            },
                            icon: Icon(
                              showpassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          hintText: AppStrings.passwordHint,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<ForgotPasswordBloc>(
                                context,
                              ).add(ForgotPasswordEvent.reset());
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ScreenForgotPassword();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          state.mapOrNull(
                            initial: (_) {},
                            loading: (_) {},
                            notverified: (value) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ScreenOtpVerify(value.user),
                                ),
                              );
                            },

                            failure: (state) {
                              AppSnackBar.show(context, state.message);
                            },
                            success: (state) {
                              switch (state.tokens.role) {
                                case AppConstants.admin ||
                                    AppConstants.superUser:
                                  BlocProvider.of<AdminProfileBloc>(
                                    context,
                                  ).add(AdminProfileEvent.getProfileDetails());
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => ScreenAdminMain(
                                        role: state.tokens.role,
                                      ),
                                    ),
                                  );
                                  break;
                                case AppConstants.customer:
                                 BottomNavWidget.navBarNotifier.value = 0;
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => ScreenMain(),
                                    ),
                                  );

                                  break;
                                default:
                              }
                            },
                          );
                        },
                        builder: (context, state) {
                          return ButtonWidget(
                            isloading: state == LoginState.loading()
                                ? true
                                : false,
                            height: 50,

                            title: AppStrings.login,
                            ontap: state != LoginState.loading()
                                ? handleLogin
                                : () {},
                          );
                        },
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.dontHaveAccount),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ScreenRegister();
                            },
                          ),
                        );
                      },
                      child: Text(
                        AppStrings.signUp,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
