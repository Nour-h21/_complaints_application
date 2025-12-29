import 'package:complaints_application/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../constants/layout/app_padding.dart';
import '../../constants/layout/app_radius.dart';
import '../../utils/helpers/size_config.dart';

class GradientElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  // final List<Color>? colors;
  final BorderRadiusGeometry? borderRadius;

  const GradientElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    // this.colors,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? AppRadius.circularSmall,
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? AppRadius.circularSmall,
            gradient: LinearGradient(
              colors: [AppColors.greenWithShade,AppColors.beige],
            ),
          ),
          child: Padding(
            padding: AppPadding.symmetricVerticalSmall,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: const Color(0xFF001108),
                  fontSize: SizeConfig.sp(18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
