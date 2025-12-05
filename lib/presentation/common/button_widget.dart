import 'package:flutter/material.dart';



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
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: ontap,
        child: Text(title),
      ),
    );
  }
}
