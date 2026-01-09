import 'package:flutter/material.dart';

import '../../Theme/app_gradient.dart';


class GradientBackground extends StatelessWidget {
  final Widget? child;

  const GradientBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [AppColors.armyGreen, AppColors.lowGreen, AppColors.beige],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
        gradient: gradients.onboardingGradient,
      ),
      child: child,
    );
  }
}
