import 'package:flutter/material.dart';

@immutable
class AppTextStyleTheme extends ThemeExtension<AppTextStyleTheme> {
  final TextStyle onboardingTitle;
  final TextStyle onboardingSubtitle;
  final TextStyle title;
  final TextStyle detTitle;
  final TextStyle settingTitle;
  final TextStyle success;
  final TextStyle cardTitle;
  final TextStyle cardSubtitle;
  final TextStyle addTitle;
  final TextStyle sectionHeader;
  final TextStyle profileName;
  final TextStyle emptyState;

  const AppTextStyleTheme({
    required this.onboardingTitle,
    required this.onboardingSubtitle,
    required this.title,
    required this.detTitle,
    required this.settingTitle,
    required this.success,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.addTitle,
    required this.sectionHeader,
    required this.profileName,
    required this.emptyState,
  });

  @override
  AppTextStyleTheme copyWith({
    TextStyle? onboardingTitle,
    TextStyle? onboardingSubtitle,
    TextStyle? title,
    TextStyle? detTitle,
    TextStyle? settingTitle,
    TextStyle? success,
    TextStyle? cardTitle,
    TextStyle? cardSubtitle,
    TextStyle? addTitle,
    TextStyle? sectionHeader,
    TextStyle? profileName,
    TextStyle? emptyState,
  }) {
    return AppTextStyleTheme(
      onboardingTitle: onboardingTitle ?? this.onboardingTitle,
      onboardingSubtitle:
          onboardingSubtitle ?? this.onboardingSubtitle,
      title: title ?? this.title,
      detTitle: detTitle ?? this.detTitle,
      settingTitle: settingTitle ?? this.settingTitle,
      success: success ?? this.success,
      cardTitle: cardTitle ?? this.cardTitle,
      cardSubtitle: cardSubtitle ?? this.cardSubtitle,
      addTitle: addTitle ?? this.addTitle,
      sectionHeader: sectionHeader ?? this.sectionHeader,
      profileName: profileName ?? this.profileName,
      emptyState: emptyState ?? this.emptyState,
    );
  }

  @override
  AppTextStyleTheme lerp(
    ThemeExtension<AppTextStyleTheme>? other,
    double t,
  ) {
    if (other is! AppTextStyleTheme) return this;
    return this;
  }
}