import 'package:flutter/material.dart';

@immutable
class AppTextStyleTheme extends ThemeExtension<AppTextStyleTheme> {
  final TextStyle onboardingTitle;
  final TextStyle onboardingSubtitle;
  final TextStyle title;
  final TextStyle detTitle;
  final TextStyle settingTitle;
  final TextStyle success;
  final TextStyle subsuccess;
  final TextStyle cardTitle;
  final TextStyle cardSubtitle;
  final TextStyle addTitle;
  final TextStyle addSubTitle;
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
    required this.subsuccess,
    required this.cardTitle,
    required this.cardSubtitle,
    required this.addTitle,
    required this.addSubTitle,
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
    TextStyle? subsuccess,
    TextStyle? cardTitle,
    TextStyle? cardSubtitle,
    TextStyle? addTitle,
    TextStyle? sectionHeader,
    TextStyle? profileName,
    TextStyle? emptyState,
    TextStyle? addSubTitle,
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
      addSubTitle: addSubTitle ?? this.addSubTitle,
      sectionHeader: sectionHeader ?? this.sectionHeader,
      profileName: profileName ?? this.profileName,
      emptyState: emptyState ?? this.emptyState, subsuccess: subsuccess?? this.subsuccess,
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