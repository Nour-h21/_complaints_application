import 'package:flutter/material.dart';

abstract class LocalizationEvent {
  const LocalizationEvent();
}

class LoadSavedLanguage extends LocalizationEvent {
  const LoadSavedLanguage();
}

class ChangeLanguage extends LocalizationEvent {
  final Locale locale;
  const ChangeLanguage(this.locale);
}