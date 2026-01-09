import 'package:complaints_application/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../Theme/app_colors.dart';
import '../../Theme/app_gradient.dart';
import '../../Theme/app_text_style.dart';
import '../../constants/colors/colors.dart';
import '../../constants/layout/app_padding.dart';
import '../../constants/layout/app_radius.dart';
import '../../utils/helpers/size_config.dart';

class GradientElevatedButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  // final List<Color>? colors;
  final BorderRadiusGeometry? borderRadius;

  const GradientElevatedButton1({
    super.key,
    required this.text,
    required this.onPressed,
    // this.colors,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
     final gradients = Theme.of(context).extension<AppGradients>()!;
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            // backgroundColor: AppColors.greenWithShade,
            shadowColor: AppColors.greenWithShade,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? AppRadius.circularSmall,
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? AppRadius.circularSmall,
              // gradient: gradients.elevatedGradient
               gradient: gradients.elevatedGradientAuth
            ),
            child: Padding(
              padding: AppPadding.symmetricVerticalSmall,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: AppColors.oliveGreen.withOpacity(0.88),
                    fontSize: SizeConfig.sp(19),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arima'
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
