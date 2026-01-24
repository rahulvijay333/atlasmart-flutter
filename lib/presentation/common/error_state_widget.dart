import 'package:flutter/material.dart';

class ErrorStateWidgetWithMessage extends StatelessWidget {
  const ErrorStateWidgetWithMessage(
    this.message, {
    super.key,
    required this.hasRefresh,
    this.ontap,
  });
  final String message;
  final bool hasRefresh;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      height: size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          if (hasRefresh == true)
            IconButton(onPressed: ontap, icon: Icon(Icons.refresh)),
        ],
      ),
    );
  }
}
