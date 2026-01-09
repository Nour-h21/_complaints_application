import 'package:flutter/material.dart';

@immutable
class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color onboardingBox;
  final Color onboardingRectangle;
  final Color cardBackground;
  final Color badge;
  final Color iconColor;
  final Color errorBackground;
  final Color navBrrBackground;
  final Color floatingButtonBackground;
  final Color floatingButtonSplashColor;

  const AppColorsTheme({
    required this.onboardingBox,
    required this.onboardingRectangle,
    required this.cardBackground,
    required this.badge,
    required this.iconColor,
    required this.errorBackground,
    required this.navBrrBackground,
    required this.floatingButtonBackground,
    required this.floatingButtonSplashColor
  });

  @override
  AppColorsTheme copyWith({
    Color? onboardingBox,
    Color? cardBackground,
    Color? badge,
    Color? iconColor,
    Color? errorBackground,
    Color? onboardingRectangle,
    Color? navBrrBackground,
    Color? floatingButtonBackground,
    Color? floatingButtonSplashColor,
  }) {
    return AppColorsTheme(
      onboardingBox: onboardingBox ?? this.onboardingBox,
      onboardingRectangle: onboardingRectangle ?? this.onboardingRectangle,
      cardBackground: cardBackground ?? this.cardBackground,
      badge: badge ?? this.badge,
      iconColor: iconColor ?? this.iconColor,
      errorBackground: errorBackground ?? this.errorBackground,
      navBrrBackground: navBrrBackground ?? this.navBrrBackground,
      floatingButtonBackground: floatingButtonBackground ?? this.floatingButtonBackground,
      floatingButtonSplashColor: floatingButtonSplashColor ?? this.floatingButtonSplashColor
    );
  }

  @override
  AppColorsTheme lerp(ThemeExtension<AppColorsTheme>? other, double t) {
    if (other is! AppColorsTheme) return this;
    return this;
  }
}
