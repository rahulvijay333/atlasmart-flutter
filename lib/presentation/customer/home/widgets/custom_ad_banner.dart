import 'package:flutter/material.dart';

class AdBannerData {
  final String badgeText;
  final String title;
  final String subtitle;
  final String buttonText;
  final String backgroundImagePath;
  final Color backgroundColor; // Base color of the image for seamless blending
  final Color badgeColor;
  final Color badgeTextColor;
  final Color buttonColor;
  final Color buttonTextColor;

  AdBannerData({
    required this.badgeText,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.backgroundImagePath,
    required this.backgroundColor,
    required this.badgeColor,
    required this.badgeTextColor,
    required this.buttonColor,
    required this.buttonTextColor,
  });
}

class CustomAdBanner extends StatelessWidget {
  final AdBannerData data;
  final VoidCallback? onTap;

  const CustomAdBanner({
    super.key,
    required this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        final bool isLargeScreen = width > 500 && height > 160;
        final bool isVerySmall = width < 320 || height < 120;

        final double badgeFontSize = isVerySmall ? 8 : (isLargeScreen ? 11 : 9);
        final double titleFontSize = isVerySmall ? 14 : (isLargeScreen ? 24 : 18);
        final double subtitleFontSize = isVerySmall ? 9 : (isLargeScreen ? 13 : 11);
        final double buttonFontSize = isVerySmall ? 10 : (isLargeScreen ? 13 : 11);

        final EdgeInsets padding = EdgeInsets.symmetric(
          horizontal: isLargeScreen ? 28 : 16,
          vertical: isLargeScreen ? 20 : 12,
        );

        return Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: data.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // 1. Right-aligned product photo covering the right side (keeps original aspect ratio)
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  width: width * (isLargeScreen ? 0.55 : 0.5), // Larger allocation on desktop
                  child: Image.asset(
                    data.backgroundImagePath,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),

                // 2. Seamless blending gradient overlay (fades from solid background to transparent)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          data.backgroundColor,
                          data.backgroundColor,
                          data.backgroundColor.withValues(alpha: 0.8),
                          data.backgroundColor.withValues(alpha: 0.3),
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [0.0, 0.35, 0.5, 0.7, 1.0], // Blends the left edge of the image
                      ),
                    ),
                  ),
                ),

                // 3. Responsive Text and Action widgets overlay
                Padding(
                  padding: padding,
                  child: Row(
                    children: [
                      // Content on the left
                      Expanded(
                        flex: isLargeScreen ? 5 : 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: data.badgeColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                data.badgeText,
                                style: TextStyle(
                                  fontSize: badgeFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: data.badgeTextColor,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            SizedBox(height: isLargeScreen ? 12 : 6),

                            // Title
                            Text(
                              data.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.15,
                                shadows: const [
                                  Shadow(
                                    color: Colors.black38,
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),

                            // Subtitle
                            Text(
                              data.subtitle,
                              maxLines: isLargeScreen ? 2 : 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                color: Colors.white.withValues(alpha: 0.9),
                                shadows: const [
                                  Shadow(
                                    color: Colors.black38,
                                    offset: Offset(0, 1),
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: isLargeScreen ? 16 : 8),

                            // CTA Button
                            InkWell(
                              onTap: onTap,
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isLargeScreen ? 20 : 12,
                                  vertical: isLargeScreen ? 8 : 6,
                                ),
                                decoration: BoxDecoration(
                                  color: data.buttonColor,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.15),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      data.buttonText,
                                      style: TextStyle(
                                        color: data.buttonTextColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: buttonFontSize,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      size: buttonFontSize + 4,
                                      color: data.buttonTextColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Right spacer to ensure text doesn't overlap the product highlight on the right
                      Expanded(
                        flex: isLargeScreen ? 4 : 3,
                        child: const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
