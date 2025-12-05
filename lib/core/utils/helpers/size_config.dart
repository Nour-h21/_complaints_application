// import 'package:flutter/widgets.dart';

// class SizeConfig {
//   static late MediaQueryData _mediaQueryData;
//   static late double screenWidth;
//   static late double screenHeight;

//   static void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData.size.width;
//     screenHeight = _mediaQueryData.size.height;
//   }
// }

import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double scaleWidth;
  static late double scaleHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    scaleWidth = screenWidth / 411.42;
    scaleHeight = screenHeight / 843.42;
  }

  // أرقام متناسقة حسب العرض
  static double w(double width) => width * scaleWidth;

  // أرقام متناسقة حسب الطول
  static double h(double height) => height * scaleHeight;

  // للخطوط
  static double sp(double size) => size * scaleWidth;
}