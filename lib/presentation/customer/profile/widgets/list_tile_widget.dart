import 'package:flutter/material.dart';



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
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: BoxShape.rectangle,
        ),
        child: Icon(Icons.api,
            size: 20, color: Theme.of(context).colorScheme.onPrimaryContainer),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: subTitle != null ? Text(subTitle ?? '') : null,
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
