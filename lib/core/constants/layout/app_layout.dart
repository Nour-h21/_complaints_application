import '../../utils/helpers/size_config.dart';


class AppLayout {
  // Example: padding
  static double paddingSmall = SizeConfig.screenWidth * 0.02;   // ~ 2% width
  static double paddingMedium = SizeConfig.screenWidth * 0.04;  // ~ 4% width
  static double paddingLarge = SizeConfig.screenWidth * 0.06;   // ~ 6% width

  // Example: margin
  static double marginSmall = SizeConfig.screenWidth * 0.02;
  static double marginMedium = SizeConfig.screenWidth * 0.04;
  static double marginLarge = SizeConfig.screenWidth * 0.06;

  // Example: border radius
  static double radiusSmall = SizeConfig.screenWidth * 0.02;
  static double radiusMedium = SizeConfig.screenWidth * 0.04;
  static double radiusLarge = SizeConfig.screenWidth * 0.06;

  // Example: sizedbox heights
  static double spaceVerticalSmall = SizeConfig.screenHeight * 0.01;
  static double spaceVerticalMedium = SizeConfig.screenHeight * 0.02;
  static double spaceVerticalLarge = SizeConfig.screenHeight * 0.03;

  // Example: sizedbox widths
  static double spaceHorizontalSmall = SizeConfig.screenWidth * 0.01;
  static double spaceHorizontalMedium = SizeConfig.screenWidth * 0.02;
  static double spaceHorizontalLarge = SizeConfig.screenWidth * 0.03;
}
