import 'package:flutter/material.dart';

import '../../../domain/constants/font.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.title,
    this.subTitle,
    this.leadingIconPath,
    required this.ontap,
  });
  final String title;
  final String? subTitle;
  final String? leadingIconPath;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Container(
        height: 38,
        width: 38,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.amber,
          shape: BoxShape.rectangle,
        ),
      ),
      title: Text(title, style: AppFont.title14Style),
      subtitle: subTitle != null ? Text(subTitle ?? '') : null,
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
