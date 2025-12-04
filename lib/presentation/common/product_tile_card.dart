import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140,
          color: Colors.blue.shade100,
          child: Center(child: Text('Image here')),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Title',
                style: TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Seller Name',
                style: TextStyle(fontSize: 10),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '5999 Rs',
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
