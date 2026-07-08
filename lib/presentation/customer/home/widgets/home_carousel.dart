import 'dart:async';
import 'package:flutter/material.dart';
import 'custom_ad_banner.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final List<AdBannerData> _banners = [
  
    AdBannerData(
      badgeText: 'VIP SELECTION',
      title: 'Royal Oudh & Perfumes',
      subtitle: 'Experience exquisite Arabian incense & luxury global perfumes.',
      buttonText: 'Shop Fragrances',
      backgroundImagePath: 'assets/royal_fragrance_banner.png',
      backgroundColor: const Color(0xFF2E020A), // Rich burgundy shadow base
      badgeColor: const Color(0xFFFFF8E1),
      badgeTextColor: const Color(0xFFFF8F00),
      buttonColor: const Color(0xFFFFA000), // Amber button
      buttonTextColor: Colors.white,
    ),
    AdBannerData(
      badgeText: 'VIP PREMIUM',
      title: 'Next-Gen Smart Devices',
      subtitle: 'Get the latest premium flagships, wearables & accessories.',
      buttonText: 'Upgrade Now',
      backgroundImagePath: 'assets/vip_tech_banner.png',
      backgroundColor: const Color(0xFF08080A), // Dark slate matte base
      badgeColor: const Color(0xFFECEFF1),
      badgeTextColor: const Color(0xFF37474F),
      buttonColor: const Color(0xFF37474F), // Slate dark button
      buttonTextColor: Colors.white,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < _banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWeb = width > 600;

    return Column(
      children: [
        SizedBox(
          height: isWeb ? 250 : 200,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _banners.length,
            itemBuilder: (context, index) {
              return CustomAdBanner(
                data: _banners[index],
                onTap: () {
                  // Custom action on banner click
                },
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _banners.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentPage == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
