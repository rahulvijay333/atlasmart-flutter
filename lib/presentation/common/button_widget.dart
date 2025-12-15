import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.height,
    required this.ontap,
    this.isloading = false,
  });
  final String title;
  final double height;
  final VoidCallback ontap;
  final bool isloading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: isloading == true
            ? ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.grey))
            : null,
        onPressed: ontap,
        child: isloading == true
            ? SizedBox(
                height: 30,
                width: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.5,
                  ),
                ),
              )
            : Text(title),
      ),
    );
  }
}
