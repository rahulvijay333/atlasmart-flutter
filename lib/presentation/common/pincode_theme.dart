import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppPinTheme {
  AppPinTheme._();

  static PinTheme otp(BuildContext context) {
    return PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(12),
      fieldHeight: 52,
      fieldWidth: 46,
      inactiveColor: Colors.grey.shade300,
      inactiveFillColor: Colors.grey.shade100,
      activeColor: Theme.of(context).primaryColor,
      activeFillColor: Colors.white,
      selectedColor: Theme.of(context).primaryColor,
      selectedFillColor: Colors.white,
    );
  }
}
