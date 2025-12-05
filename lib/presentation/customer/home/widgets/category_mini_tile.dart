import 'package:flutter/material.dart';

class CatgoryMiniTileWidget extends StatelessWidget {
  const CatgoryMiniTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.category, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 4),
        Text(
          'Category',
          style: Theme.of(context).textTheme.labelSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

