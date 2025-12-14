import 'package:flutter/widgets.dart';
import 'app_layout.dart';

class AppPadding {
  // Uniform padding
  static EdgeInsets allMedium = EdgeInsets.all(AppLayout.paddingMedium);
  static EdgeInsets allSmall = EdgeInsets.all(AppLayout.paddingSmall);
  static EdgeInsets allLarge = EdgeInsets.all(AppLayout.paddingLarge);
  static EdgeInsets allVerySmall = EdgeInsets.all(AppLayout.paddingVerySmall);

  // Symmetric padding
  static EdgeInsets symmetricVerticalSmall = EdgeInsets.symmetric(
    vertical: AppLayout.paddingSmallsymmetric,
  );
  static EdgeInsets symmetricHorizontalSmall = EdgeInsets.symmetric(
    horizontal: AppLayout.paddingSmallsymmetric,
  );

  static EdgeInsets symmetricHorizontSmall = EdgeInsets.symmetric(
    horizontal: AppLayout.paddingSmall,
  );
  static EdgeInsets symmetricVerticSmall = EdgeInsets.symmetric(
    vertical: AppLayout.paddingSymetricSmall,
  );
  static EdgeInsets symmetricHorizontalVerySmall = EdgeInsets.symmetric(
    horizontal: AppLayout.paddingSymetricVerySmall,
  );


    // Only padding
  static EdgeInsets onlyTopLarge = EdgeInsets.only(top: AppLayout.topLarge);
  static EdgeInsets onlyTopLargeAndLeftMed = EdgeInsets.only(top: AppLayout.topLarge,left: AppLayout.leftMed); 
  static EdgeInsets onlyTopMedAndLeftLarge = EdgeInsets.only(top: AppLayout.topMed,left: AppLayout.leftVeryLarge); 
  static EdgeInsets onlyTopLargeAndLeftVeryMed = EdgeInsets.only(top: AppLayout.topLarge,left: AppLayout.leftVeryMed); 

  static EdgeInsets onlyRightLarge = EdgeInsets.only(right: AppLayout.rightLarge);
  static EdgeInsets onlyRightSmall = EdgeInsets.only(right: AppLayout.rightSmall);
  static EdgeInsets onlyRightMedium = EdgeInsets.only(right: AppLayout.rightMedium);
  static EdgeInsets onlyLeftLarge = EdgeInsets.only(left: AppLayout.leftLarge);
}
