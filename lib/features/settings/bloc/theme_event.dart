///event
import 'package:flutter/foundation.dart';



@immutable
sealed class ThemeEvent {}
class InitThemeEvent extends ThemeEvent {}
class ChangeThemeEvent extends ThemeEvent {}