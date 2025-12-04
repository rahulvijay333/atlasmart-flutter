import 'package:atlasmart/domain/constants/image.dart';
import 'package:atlasmart/presentation/login/screen_login.dart';
import 'package:flutter/material.dart';

import '../main/screen_main.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      if ( context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenLogin()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImage.appLogo),
              Text('Everything you need, in one place.')
            ],
          ),
        ),
      ),
    );
  }
}
