import 'package:flutter/material.dart';

import '../../constants/layout/app_padding.dart';
import '../../constants/layout/app_space.dart';
import '../../constants/styles/text_styles.dart';
import '../../constants/urls/assets_url.dart';
import '../../utils/helpers/size_config.dart';

class BackgroundWithLogo extends StatelessWidget {
  final Widget child;
  final String appbarName;
  final EdgeInsets padding;
  final bool useListview;
  final Widget icon;
  const BackgroundWithLogo({
    super.key,
    required this.child,
    required this.appbarName,
    required this.padding,
    required this.useListview, required this.icon,
    
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.background),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Column(
            children: [
             Row(
               children: [
                 icon,
               ],
             ),
              Row(
                children: [
                  Padding(
                    padding: AppPadding.onlyTopLarge,
                    child: Image.asset(
                      AppAssets.logoWithoutBackground,
                      height: SizeConfig.h(60),
                      width: SizeConfig.w(140),
                    ),
                  ),
                  Padding(
                    padding: padding,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        appbarName,
                        style: AppTextStyles.bigBeigeStyle,
                      ),
                    ),
                  ),
                ],
              ),

              AppSpaces.verticalVeryLarge,

              useListview
                  ? SizedBox(
                      height: 498,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [child, AppSpaces.verticalVeryLarge],
                      ),
                    )
                  : child,
            ],
          ),
        ],
      ),
    );
  }
}
