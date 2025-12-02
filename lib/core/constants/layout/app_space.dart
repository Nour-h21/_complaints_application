import 'package:flutter/widgets.dart';
import 'app_layout.dart';

class AppSpaces {
  // Vertical spaces
  static Widget verticalSmall = SizedBox(height: AppLayout.spaceVerticalSmall);
  static Widget verticalMedium = SizedBox(height: AppLayout.spaceVerticalMedium);
  static Widget verticalLarge = SizedBox(height: AppLayout.spaceVerticalLarge);

  // Horizontal spaces
  static Widget horizontalSmall = SizedBox(width: AppLayout.spaceHorizontalSmall);
  static Widget horizontalMedium = SizedBox(width: AppLayout.spaceHorizontalMedium);
  static Widget horizontalLarge = SizedBox(width: AppLayout.spaceHorizontalLarge);
}
