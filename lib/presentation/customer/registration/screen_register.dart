import 'package:atlasmart/domain/constants/font.dart';
import 'package:atlasmart/domain/constants/strings.dart';
import 'package:flutter/material.dart';

import '../../../domain/constants/colors.dart';
import '../../../domain/constants/image.dart';
import '../../common/button_widget.dart';

class ScreenRegister extends StatelessWidget {
  const ScreenRegister({super.key});

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
                        hintText: AppStrings.fullNameHint,
                      ),
                    ),
                  ),
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
                    title: AppStrings.createAccount,
                    ontap: () {},
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
