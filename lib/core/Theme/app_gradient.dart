import 'package:flutter/material.dart';

@immutable
class AppGradients extends ThemeExtension<AppGradients> {
  final LinearGradient onboardingGradient;
  final LinearGradient elevatedGradient;
  final LinearGradient elevatedGradientAuth;

  const AppGradients({
    required this.onboardingGradient,
    required this.elevatedGradient,
    required this.elevatedGradientAuth,
  });

  @override
  AppGradients copyWith({
    LinearGradient? onboardingGradient,
    LinearGradient? elevatedGradient,
    LinearGradient? elevatedGradientAuth,
  }) {
    return AppGradients(
      onboardingGradient: onboardingGradient ?? this.onboardingGradient,
      elevatedGradient: elevatedGradient ?? this.elevatedGradient,
      elevatedGradientAuth: elevatedGradientAuth ?? this.elevatedGradientAuth,
    );
  }

  @override
  AppGradients lerp(
    ThemeExtension<AppGradients>? other,
    double t,
  ) {
    if (other is! AppGradients) return this;
    return AppGradients(
      onboardingGradient: LinearGradient.lerp(
        onboardingGradient,
        other.onboardingGradient,
        t,
      )!,
      elevatedGradient: LinearGradient.lerp(
        elevatedGradient,
        other.elevatedGradient,
        t,
      )!,
         elevatedGradientAuth: LinearGradient.lerp(
        elevatedGradient,
        other.elevatedGradient,
        t,
      )!,
    );
  }
}
