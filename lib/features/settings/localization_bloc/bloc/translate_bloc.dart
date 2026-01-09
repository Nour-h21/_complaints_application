import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'translate_event.dart';
import 'translate_state.dart';

class LocalizationBloc
    extends Bloc<LocalizationEvent, LocalizationState> {
  static const _langKey = 'lang';
  static const _countryKey = 'country';

  LocalizationBloc()
      : super(const LocalizationState(Locale('ar', 'AR'))) {
    on<LoadSavedLanguage>(_loadSavedLanguage);
    on<ChangeLanguage>(_changeLanguage);
  }

  Future<void> _loadSavedLanguage(
    LoadSavedLanguage event,
    Emitter<LocalizationState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString(_langKey);
    final country = prefs.getString(_countryKey);

    if (lang != null) {
      emit(LocalizationState(
        Locale(lang, country?.isEmpty == true ? null : country),
      ));
    }
  }

  Future<void> _changeLanguage(
    ChangeLanguage event,
    Emitter<LocalizationState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_langKey, event.locale.languageCode);
    await prefs.setString(
      _countryKey,
      event.locale.countryCode ?? '',
    );

    emit(LocalizationState(event.locale));
  }
}