import 'package:flutter/material.dart';

class PromoBannerWidget extends StatelessWidget {
  const PromoBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWeb = width > 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isWeb ? 32 : 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.blue.shade900, Colors.blue.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: isWeb
          ? ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 250),
              child: Row(
                children: [
                  Expanded(child: _buildTextContent(context, isWeb)),
                  const SizedBox(width: 32),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/electronics_banner.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextContent(context, isWeb),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/electronics_banner.png',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isWeb) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'LIMITED TIME OFFER',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Upgrade Your Home Office\nWith Premium Gadgets',
          style:
              (isWeb
                      ? Theme.of(context).textTheme.headlineMedium
                      : Theme.of(context).textTheme.titleLarge)
                  ?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
        ),
        const SizedBox(height: 12),
        Text(
          'Get exclusive discounts on high-end laptops, monitors, and ergonomic chairs.',
          style: TextStyle(
            color: Colors.white.withValues (alpha:  0.9),
            fontSize: isWeb ? 16 : 14,
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue.shade900,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Explore Now',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
