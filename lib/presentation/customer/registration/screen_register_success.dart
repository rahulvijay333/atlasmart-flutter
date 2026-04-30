import 'package:flutter/material.dart';

import '../../../domain/core/constants/colors.dart';
import '../../../domain/core/constants/font.dart';
import '../../../domain/core/constants/image.dart';
import '../../common/button_widget.dart';

class ScreenRegisterSuccess extends StatelessWidget {
  const ScreenRegisterSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              spacing: 50,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset(AppImage.appLogo, height: 250)),

                Text(
                  'Account Created Successfully',
                  style: AppFont.title18Style,
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.orange,
                  size: 100,
                ),

                Text(
                  'Your account has been created successfully.\n'
                  'You can now log in using your email and password.',
                  style: AppFont.title14Style,
                  textAlign: TextAlign.start,
                ),

                ButtonWidget(
                  height: 50,
                  title: 'Login',
                  ontap: () {
                    Navigator.of(context).pop();
                  },
                ),

                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
