import 'package:flutter/material.dart';

@immutable
sealed class ThemeState {}
final class ThemeInitial extends ThemeState {}
class CurrentThemeState extends ThemeState {
final ThemeData currentTheme;
CurrentThemeState({required this.currentTheme});
}