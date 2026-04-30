import 'package:flutter/material.dart';

enum Flavor { dev, prod }

class AppConfig {
  final Flavor flavor;
  final String baseUrl;

  static late AppConfig instance;

  AppConfig({required this.flavor, required this.baseUrl});

  static void initialize(AppConfig config) {
    // assert(() {
    debugPrint('Connected to ${config.flavor} | URL: ${config.baseUrl}');
    //   return true;
    // }());

    instance = config;
  }
}
