import 'package:atlasmart/domain/constants/image.dart';
import 'package:atlasmart/presentation/customer/main/screen_main.dart';
import 'package:atlasmart/presentation/customer/registration/screen_register.dart';
import 'package:atlasmart/presentation/admin/main/screen_admin_main.dart'; // Admin Link
import 'package:flutter/material.dart';

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

    if (email == 'admin@test.com' && password == '1234') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ScreenAdminMain()),
      );
    } else if (email == 'user@test.com' && password == '1234') {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => ScreenMain()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppStrings.invalidCredentialsError),
          backgroundColor: Colors.red,
        ),
      );
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
                    ButtonWidget(
                      height: 50,
                      title: AppStrings.login,
                      ontap: handleLogin,
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
