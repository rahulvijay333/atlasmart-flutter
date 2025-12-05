import 'package:atlasmart/domain/constants/colors.dart';
import 'package:atlasmart/domain/constants/font.dart';
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
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(AppImage.appLogo, height: 250)),

              Text(
                AppStrings.loginScreenMessage,
                style: AppFont.title16Style,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.email),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 0.8),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintStyle: AppFont.hintText14StyleGreyColor,
                        border: InputBorder.none,
                        hintText: AppStrings.emailHint,
                      ),
                    ),
                  ),

                  Text(AppStrings.password),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 0.8),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintStyle: AppFont.hintText14StyleGreyColor,
                        border: InputBorder.none,
                        hintText: AppStrings.passwordHint,
                      ),
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
              SizedBox(height: 25),
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
