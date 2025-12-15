import 'package:atlasmart/application/login/login_bloc.dart';
import 'package:atlasmart/domain/constants/image.dart';
import 'package:atlasmart/presentation/customer/main/screen_main.dart';
import 'package:atlasmart/presentation/customer/registration/screen_register.dart';
import 'package:atlasmart/presentation/admin/main/screen_admin_main.dart'; // Admin Link
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/constants/constants.dart';
import '../../domain/constants/strings.dart';
import '../common/button_widget.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    BlocProvider.of<LoginBloc>(
      context,
    ).add(LoginEvent.loginButtonClickEvent(email: email, password: password));

    // if (email == 'admin@test.com' && password == '1234') {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => const ScreenAdminMain()),
    //   );
    // } else if (email == 'user@test.com' && password == '1234') {
    //   Navigator.of(
    //     context,
    //   ).pushReplacement(MaterialPageRoute(builder: (context) => ScreenMain()));
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text(AppStrings.invalidCredentialsError),
    //       backgroundColor: Colors.red,
    //     ),
    //   );
    // }
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
                Column(
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
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: AppStrings.passwordHint,
                      ),
                    ),
                    SizedBox(height: 15),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        state.map(
                          initial: (_) {},
                          loading: (_) {},
                          failure: (state) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          },
                          success: (state) {
                            switch (state.tokens.role) {
                              case AppConstants.admin:
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ScreenAdminMain(),
                                  ),
                                );
                                break;
                              case AppConstants.customer:
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

                Column(
                  children: [
                    Text(
                      'Credentials for Testing',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text('admin@test.com and password "1234"'),
                    Text('user@test.com and password "1234"'),
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
