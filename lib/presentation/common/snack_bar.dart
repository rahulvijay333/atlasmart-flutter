import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/material.dart';

class AppSnackBar {
  static Timer? _timer;
  static bool _isShowing = false;

  static void show(
    BuildContext context,
    String message, {
    Color backgroundColor = Colors.black,
    Duration duration = const Duration(seconds: 2),
    Duration debounceDuration = const Duration(milliseconds: 500),
  }) {
    if (_isShowing) return;

    _timer?.cancel();
    _timer = Timer(debounceDuration, () {
      _isShowing = true;

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: backgroundColor,
            duration: duration,
          ),
        ).closed.then((_) {
          _isShowing = false;
        });
    });
  }

  static void success(BuildContext context, String message) {
    show(context, message, backgroundColor: Colors.green);
  }

  static void error(BuildContext context, String message) {
    show(context, message, backgroundColor: Colors.red);
  }
}
