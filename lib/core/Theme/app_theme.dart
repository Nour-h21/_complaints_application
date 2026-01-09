import 'package:complaints_application/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';
import '../utils/helpers/size_config.dart';
import 'app_colors.dart';
import 'app_gradient.dart';
import 'app_text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    extensions: [
      AppGradients(
        onboardingGradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [AppColors.armyGreen, AppColors.lowGreen, AppColors.beige],
        ),
        elevatedGradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 253, 250, 218),
            Colors.green.shade100,
          ],
        ),
      ),

      AppTextStyleTheme(
        onboardingTitle: AppTextStyles.largOliveGreenStyle,
        onboardingSubtitle: AppTextStyles.medMedGreenStyle,
        title: AppTextStyles.medOliveGreenStyle,
        detTitle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.oliveGreen,
          fontFamily: 'Arima',
        ),
        settingTitle: TextStyle(
          fontFamily: 'Arima',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.beige,
        ),
        success: TextStyle(fontSize: 14, color: Colors.green),
        cardTitle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        cardSubtitle: TextStyle(fontSize: 14, color: Colors.grey),
        addTitle: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: AppColors.oliveGreen,
          fontFamily: 'Arima',
        ),
        sectionHeader: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        profileName: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        emptyState: TextStyle(fontSize: 16, color: Colors.grey),
      ),

      AppColorsTheme(
        onboardingBox: AppColors.lowGreen,
        cardBackground: AppColors.lowGreen,
        badge: Colors.pink,
        iconColor: AppColors.oliveGreen,
        errorBackground: Colors.red.withOpacity(0.1),
        onboardingRectangle: AppColors.oliveGreen,
        navBrrBackground: AppColors.lowGreen,
        floatingButtonBackground: AppColors.oliveGreen,
        floatingButtonSplashColor: AppColors.oliveGreen,
      ),
    ],

    //////
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple.withOpacity(0.8),
      foregroundColor: Colors.white,
      // elevation: 20,
      shadowColor: Colors.pink,
      // surfaceTintColor: Colors.white,
    ),
    // colorSchemeSeed: Colors.amber,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.oliveGreen,
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
      ),
    ),
    primaryColor: Colors.grey,
  );
  static ThemeData darkTheme = ThemeData(
    extensions: [
      AppGradients(
        onboardingGradient: LinearGradient(
          // begin: Alignment.topCenter,
          // end: Alignment.bottomCenter,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.armyGreen,
            AppColors.armyGreen2,
            AppColors.oliveGreen2,
          ],
        ),
        elevatedGradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 253, 250, 218),
            Colors.green.shade100,
            AppColors.armyGreen,
          ],
        ),
      ),
      AppTextStyleTheme(
        onboardingTitle: TextStyle(
          fontSize: SizeConfig.h(30),
          color: AppColors.beige,
          fontWeight: FontWeight.bold,
          fontFamily: 'Arima',
        ),
        onboardingSubtitle: TextStyle(
          fontSize: SizeConfig.h(18),
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Arima',
        ),
        title: TextStyle(
          fontSize: SizeConfig.h(23),
          color: AppColors.beige,
          fontWeight: FontWeight.bold,
          fontFamily: 'Arima',
        ),
        detTitle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.beige,
          fontFamily: 'Arima',
        ),
        settingTitle: TextStyle(
          fontFamily: 'Arima',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.offWhite,
        ),
        success: TextStyle(fontSize: 14, color: Colors.green),
        cardTitle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        cardSubtitle: TextStyle(fontSize: 14, color: Colors.grey),
        addTitle: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w600,
          color: AppColors.beige,
          fontFamily: 'Arima',
        ),
        sectionHeader: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        profileName: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        emptyState: TextStyle(fontSize: 16, color: Colors.grey),
      ),
      AppColorsTheme(
        onboardingBox: AppColors.whiteWithOpacity3,
        cardBackground: AppColors.whiteWithOpacity3,
        badge: Colors.pink,
        iconColor: AppColors.beige,
        errorBackground: Colors.red.withOpacity(0.1),
        onboardingRectangle: AppColors.oliveGreen2,
        navBrrBackground: AppColors.armyGreen2,
        floatingButtonBackground: AppColors.oliveGreen,
        floatingButtonSplashColor: AppColors.oliveGreen,
      ),
    ],

    /////
    // appBarTheme: AppBarTheme(
    //   backgroundColor: Colors.amber.withOpacity(0.8),
    //   foregroundColor: Colors.white,
    //   // elevation: 20,
    //   shadowColor: Colors.yellow,
    //   // surfaceTintColor: Colors.white,
    // ),
    // colorSchemeSeed: Colors.amber,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 0, 10, 0),
      brightness: Brightness.dark,
      // surfaceContainerLow: Colors.white,
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     foregroundColor: Colors.white,
    //     backgroundColor: Colors.amber,
    //   ),
    // ),
    primaryColor: Colors.white,
  );
}
