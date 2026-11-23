import 'package:material_ui/material_ui.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// class AppPinTheme {
//   AppPinTheme._();

//   static PinTheme otp(BuildContext context) {
//     return PinTheme(
//       shape: PinCodeFieldShape.box,
//       borderRadius: BorderRadius.circular(12),
//       fieldHeight: 52,
//       fieldWidth: 46,
//       inactiveColor: Colors.grey.shade300,
//       inactiveFillColor: Colors.grey.shade100,
//       activeColor: Theme.of(context).primaryColor,
//       activeFillColor: Colors.white,
//       selectedColor: Theme.of(context).primaryColor,
//       selectedFillColor: Colors.white,
//     );
//   }
// }


class AppPinTheme {
  AppPinTheme._();

  static MaterialPinTheme otp(BuildContext context) {
    return MaterialPinTheme(
      shape: MaterialPinShape.outlined,
      borderRadius: BorderRadius.circular(12),

      // Dimensions
      cellSize: const Size(46, 52),
      spacing: 8,

      // Borders
      borderColor: Colors.grey.shade300,
      focusedBorderColor: Theme.of(context).primaryColor,
      filledBorderColor: Theme.of(context).primaryColor,

      // Background colors
      fillColor: Colors.grey.shade100,
      focusedFillColor: Colors.white,
      filledFillColor: Colors.white,
    );
  }
}
