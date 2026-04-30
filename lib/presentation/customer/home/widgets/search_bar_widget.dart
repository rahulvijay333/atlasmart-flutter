import 'package:flutter/material.dart';
import '../../../../domain/core/constants/strings.dart';
import '../../search/screen_search_product.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ScreenSearchProduct()),
        );
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IgnorePointer(
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              hintText: AppStrings.searchProductsHint,
              hintStyle: TextStyle(color: Colors.grey.shade500),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ),
    );
  }
}
