import 'package:flutter/material.dart';
import '../../../../domain/core/constants/strings.dart';

class CatgoryMiniTileWidget extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color? color;

  const CatgoryMiniTileWidget({
    super.key,
    this.title,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWeb = width > 800;
    final size = isWeb ? 70.0 : 60.0;

    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: (color ?? Colors.blue).withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: (color ?? Colors.blue).withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Icon(
            icon ?? Icons.category,
            color: color ?? Colors.blue,
            size: isWeb ? 32 : 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title ?? AppStrings.categoryPlaceholder,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
