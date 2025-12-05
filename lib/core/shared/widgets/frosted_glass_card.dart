import 'dart:ui';
import 'package:flutter/material.dart';
import '../../constants/layout/app_padding.dart';
import '../../constants/layout/app_radius.dart';
import '../../utils/helpers/size_config.dart';

class FrostedGlassCard extends StatelessWidget {
  final Widget child;
  final double width;
  final bool scrollable;
  final double? height;

  const FrostedGlassCard({
    super.key,
    required this.child,
    this.height,
    required this.width,
    this.scrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = child;

    if (scrollable) {
      content = SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: child,
      );
    }

    return Center(
      child: ClipRRect(
        borderRadius: AppRadius.circularMedium,
        child: BackdropFilter(
          filter: ImageFilter.blur( sigmaX: SizeConfig.w(20),
                  sigmaY: SizeConfig.h(20),),
          child: Container(
            width: SizeConfig.w(width),
            height: height != null ? SizeConfig.h(height!) : null,
            padding: AppPadding.allMedium,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: AppRadius.circularMedium,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: SizeConfig.w(1.5),
              ),
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}
