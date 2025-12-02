import 'package:complaints_application/core/constants/colors/colors.dart';
import 'package:flutter/widgets.dart';

import '../../utils/helpers/size_config.dart';

class AppTextStyles {
 static TextStyle welStyle = TextStyle(
    fontSize: SizeConfig.screenWidth * 0.073, // بدل 30
    color: AppColors.primaryb,
    fontFamily: 'Arima',
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  );

 static TextStyle plStyle = TextStyle(
    fontSize: SizeConfig.screenWidth * 0.044, // بدل 18
    color: AppColors.primaryb,
    fontFamily: 'Arima',
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
  
  );

 static TextStyle buttonAuthStyle = TextStyle(
    fontSize: SizeConfig.screenWidth * 0.049, // بدل 20
    color: AppColors.primaryb,
    fontFamily: 'Arima',
    fontWeight: FontWeight.w800,
    letterSpacing: 1,
  );

  static TextStyle buttonAuthNoAcountStyle = TextStyle(
    fontSize: SizeConfig.screenWidth * 0.049, // بدل 20
    color: AppColors.primaryb,
    fontFamily: 'Arima',
    fontWeight: FontWeight.w800,
    letterSpacing: 1,
  );

  static TextStyle appTextStyle = TextStyle(
    fontSize: SizeConfig.screenWidth * 0.072, // بدل 30
    color: AppColors.brown,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
  );

  static TextStyle hintStyle = TextStyle(
    fontSize: SizeConfig.screenWidth * 0.040, 
    color: AppColors.brown,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
  );

  static TextStyle midStyle = TextStyle(
    fontSize: SizeConfig.screenWidth * 0.049,  
    color: AppColors.brown,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  );


  static TextStyle midStyleBaig = TextStyle(
    fontSize: SizeConfig.screenWidth * 0.042, 
    color: AppColors.baig,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  );

   static TextStyle smallStyleBaig = TextStyle(
    fontSize: SizeConfig.screenWidth * 0.034, 
    color: AppColors.baig,
    fontWeight: FontWeight.w800,
    letterSpacing: 1,
  );

   static TextStyle smallStyleBrown = TextStyle(
    fontSize: SizeConfig.screenWidth * 0.038, // بدل 16.5
    color: AppColors.brown,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  );
}
