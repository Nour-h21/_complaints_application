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
  final Color hindnoaccount;
  final Color hindTextFieldInput;

  const AppColorsTheme({
    required this.onboardingBox,
    required this.onboardingRectangle,
    required this.cardBackground,
    required this.badge,
    required this.iconColor,
    required this.errorBackground,
    required this.navBrrBackground,
    required this.floatingButtonBackground,
    required this.floatingButtonSplashColor,
    required this.hindnoaccount,
    required this.hindTextFieldInput,
  });

  @override
  AppColorsTheme copyWith({
    Color? onboardingBox,
    Color? onboardingRectangle,
    Color? cardBackground,
    Color? badge,
    Color? iconColor,
    Color? errorBackground,
    Color? navBrrBackground,
    Color? floatingButtonBackground,
    Color? floatingButtonSplashColor,
    Color? hindnoaccount,
    Color? hindTextFieldInput,
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
      floatingButtonSplashColor: floatingButtonSplashColor ?? this.floatingButtonSplashColor,
      hindnoaccount: hindnoaccount ?? this.hindnoaccount,
      hindTextFieldInput: hindTextFieldInput ?? this.hindTextFieldInput,
    );
  }

  @override
  AppColorsTheme lerp(ThemeExtension<AppColorsTheme>? other, double t) {
    if (other is! AppColorsTheme) return this;
    return this;
  }
}
