import 'package:flutter/material.dart';

import '../../domain/core/constants/image.dart';
import '../common/button_widget.dart';

class ScreenForgotPasswordSuccess extends StatelessWidget {
  const ScreenForgotPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImage.appLogo, height: 180),

              const SizedBox(height: 30),

              // ✅ Title
              const Text(
                'Password Reset Successful',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              // ✅ Description
              const Text(
                'Your password has been updated successfully.\nPlease login with your new password.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              ButtonWidget(height: 50, title: 'Back to Login', ontap: () {
                Navigator.of(context).pop();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
