import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/customer/main/screen_main.dart';
import 'presentation/splash/screen_splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AtlasMart',
      home: ScreenSplash(),
    );
  }
}
