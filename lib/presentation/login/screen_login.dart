
import 'package:atlasmart/domain/constants/image.dart';
import 'package:atlasmart/presentation/customer/main/screen_main.dart';
import 'package:atlasmart/presentation/customer/registration/screen_register.dart';
import 'package:flutter/material.dart';

import '../../domain/constants/strings.dart';
import '../common/button_widget.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(spacing: 25,
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
                    Text(AppStrings.email, style: Theme.of(context).textTheme.titleMedium),
                    
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: AppStrings.emailHint,
                      ),
                    ),
        
                    Text(AppStrings.password, style: Theme.of(context).textTheme.titleMedium),
        
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: AppStrings.passwordHint,
                      ),
                    ),
                    SizedBox(height: 15),
                    ButtonWidget(
                      height: 50,
                      title: AppStrings.login,
                      ontap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return ScreenMain();
                            },
                          ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
