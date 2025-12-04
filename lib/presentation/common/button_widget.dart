import 'package:flutter/material.dart';

import '../../domain/constants/font.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.height,
    required this.ontap,
  });
  final String title;
  final double height;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(title, style: AppFont.title14BoldStyleWhiteColor),
        ),
      ),
    );
  }
}
