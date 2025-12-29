import 'package:flutter/material.dart';

import '../../constants/colors/colors.dart';

class GradientBackground extends StatelessWidget {
  final Widget ? child;

  const GradientBackground({super.key,  this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.armyGreen,
                    AppColors.lowGreen,
                    AppColors.beige,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
