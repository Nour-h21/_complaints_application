import 'package:flutter/material.dart';

@immutable
class AppGradients extends ThemeExtension<AppGradients> {
  final LinearGradient onboardingGradient;
  final LinearGradient elevatedGradient;

  const AppGradients({
    required this.onboardingGradient,
    required this.elevatedGradient
  });

  @override
  AppGradients copyWith({
    LinearGradient? onboardingGradient,
    LinearGradient? elevatedGradient,
  }) {
    return AppGradients(
      onboardingGradient:
          onboardingGradient ?? this.onboardingGradient,
           elevatedGradient:
          elevatedGradient ?? this.elevatedGradient,
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
    );
  }
  
 
}