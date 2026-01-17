import 'package:atlasmart/domain/core/constants/font.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static Future<bool?> showConfirmation(
    BuildContext context, {
    required String title,
    required String description,
    String positiveText = 'Yes',
    String negativeText = 'No',
    VoidCallback? onPositivePressed,
    VoidCallback? onNegativePressed,
    bool barrierDismissible = false,
  }) {
    return showDialog<bool>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            title,
            style: AppFont.title16Style,
            textAlign: TextAlign.center,
          ),
          content: Text(
            description,
            style: TextStyle(color: Colors.grey.shade700),
          ),
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          actions: [
            TextButton(
              onPressed: () {
                onNegativePressed?.call();
                Navigator.of(context, rootNavigator: true).pop(false);
              },
              child: Text(negativeText),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                onPositivePressed?.call();
                Navigator.of(context, rootNavigator: true).pop(true);
              },
              child: Text(positiveText),
            ),
          ],
        );
      },
    );
  }
}
