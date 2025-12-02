import 'package:flutter/widgets.dart';
import 'app_layout.dart';

class AppPadding {
  // Uniform padding
  static EdgeInsets allSmall = EdgeInsets.all(AppLayout.paddingSmall);
  static EdgeInsets allMedium = EdgeInsets.all(AppLayout.paddingMedium);
  static EdgeInsets allLarge = EdgeInsets.all(AppLayout.paddingLarge);

  // Symmetric padding
  static EdgeInsets symmetricVerticalSmall = EdgeInsets.symmetric(vertical: AppLayout.paddingSmall);
  static EdgeInsets symmetricVerticalMedium = EdgeInsets.symmetric(vertical: AppLayout.paddingMedium);
  static EdgeInsets symmetricHorizontalSmall = EdgeInsets.symmetric(horizontal: AppLayout.paddingSmall);
  static EdgeInsets symmetricHorizontalMedium = EdgeInsets.symmetric(horizontal: AppLayout.paddingMedium);
}
