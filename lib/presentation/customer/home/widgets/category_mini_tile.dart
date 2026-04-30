import 'package:flutter/material.dart';
import '../../../../domain/core/constants/strings.dart';

class CatgoryMiniTileWidget extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final VoidCallback? onTap;

  const CatgoryMiniTileWidget({
    super.key,
    this.title,
    this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWeb = width > 800;
    final size = isWeb ? 70.0 : 60.0;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: imageUrl != null && imageUrl!.isNotEmpty
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.category_outlined,
                        color: Colors.grey,
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      },
                    )
                  : const Icon(Icons.category_outlined, color: Colors.grey),
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
      ),
    );
  }
}
