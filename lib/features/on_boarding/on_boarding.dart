import 'package:complaints_application/core/constants/styles/text_styles.dart';
import 'package:complaints_application/core/constants/urls/assets_url.dart';
import 'package:complaints_application/core/utils/helpers/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/Theme/app_colors.dart';
import '../../core/Theme/app_gradient.dart';
import '../../core/Theme/app_text_style.dart';
import '../../core/constants/colors/colors.dart';

PageController controller = PageController();

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      children: [FirstPage(), SecondPage(), ThirdPage()],
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;
    final texts = Theme.of(context).extension<AppTextStyleTheme>()!;
    final colors = Theme.of(context).extension<AppColorsTheme>()!;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: gradients.onboardingGradient,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.h(328),
                  top: SizeConfig.h(25),
                ),
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).push('/NavicationBar');
                  },
                  child: Text('Skip', style: AppTextStyles.medBeigeStyle),
                ),
              ),
              SizedBox(height: SizeConfig.h(25)),
              Image.asset(AppAssets.onboarding1, height: SizeConfig.h(280)),

              SizedBox(height: SizeConfig.h(55)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Text(
                      'Report any issue, in minutes',
                      textAlign: TextAlign.center,
                      style: texts.onboardingTitle,
                    ),
                    SizedBox(height: SizeConfig.h(10)),
                    Text(
                      "Your task is simple: describe the issue, pinpoint the location, and upload supporting files like photos. Your complaint goes directly to the concerned authority.",
                      style: texts.onboardingSubtitle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.h(100)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: SizeConfig.h(6),
                    width: SizeConfig.w(26),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: colors.onboardingRectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: SizeConfig.w(5)),
                  Container(
                    height: SizeConfig.h(7),
                    width: SizeConfig.w(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.onboardingBox,
                    ),
                  ),
                  SizedBox(width: SizeConfig.w(5)),
                  Container(
                    height: SizeConfig.h(7),
                    width: SizeConfig.w(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.onboardingBox,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;
    final texts = Theme.of(context).extension<AppTextStyleTheme>()!;
    final colors = Theme.of(context).extension<AppColorsTheme>()!;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: gradients.onboardingGradient,
            // gradient: LinearGradient(
            //   colors: [
            //     // AppColors.lowGreen,
            //     // AppColors.offWhite,

            //     AppColors.armyGreen,
            //     AppColors.lowGreen,
            //     AppColors.beige,

            //     //  AppColors.armyGreen,
            //     // AppColors.armyGreen2,
            //     // AppColors.oliveGreen2,
            //   ],
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            // ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.h(328),
                  top: SizeConfig.h(25),
                ),
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).push('/NavicationBar');
                  },
                  child: Text('Skip', style: AppTextStyles.medBeigeStyle),
                ),
              ),
              SizedBox(height: SizeConfig.h(25)),
              Image.asset(AppAssets.onboarding2, height: SizeConfig.h(280)),

              SizedBox(height: SizeConfig.h(55)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Text(
                      'Track your complaint, step by step',
                      textAlign: TextAlign.center,
                      style: texts.onboardingTitle,
                    ),
                    SizedBox(height: SizeConfig.h(10)),
                    Text(
                      "No more guessing! Follow your complaint's status in real-time. Know when it's received, reviewed, and resolved. We guarantee full transparency.",
                      style: texts.onboardingSubtitle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.h(100)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: SizeConfig.h(7),
                    width: SizeConfig.w(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.onboardingBox,
                    ),
                  ),
                  SizedBox(width: SizeConfig.w(5)),
                  Container(
                    height: SizeConfig.h(6),
                    width: SizeConfig.w(26),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: colors.onboardingRectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: SizeConfig.w(5)),
                  Container(
                    height: SizeConfig.h(7),
                    width: SizeConfig.w(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: AppColors.lowGreen,
                      color: colors.onboardingBox,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gradients = Theme.of(context).extension<AppGradients>()!;
    final texts = Theme.of(context).extension<AppTextStyleTheme>()!;
    final colors = Theme.of(context).extension<AppColorsTheme>()!;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: gradients.onboardingGradient),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.h(70)),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.h(55)),
                child: Image.asset(
                  AppAssets.onboarding3,
                  height: SizeConfig.h(280),
                ),
              ),

              SizedBox(height: SizeConfig.h(55)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Text(
                      'All your complaints, organized in one place',
                      textAlign: TextAlign.center,
                      style: texts.onboardingTitle,
                    ),
                    SizedBox(height: SizeConfig.h(10)),
                    Text(
                      "Review your complaint history, recall details of any case, and benefit from past solutions. Your government services are now easier.",
                      style: texts.onboardingSubtitle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.h(136)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(27)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeConfig.h(7),
                      width: SizeConfig.w(7),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.onboardingBox,
                      ),
                    ),

                    SizedBox(width: SizeConfig.w(5)),
                    Container(
                      height: SizeConfig.h(7),
                      width: SizeConfig.w(7),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.onboardingBox,
                      ),
                    ),
                    SizedBox(width: SizeConfig.w(5)),
                    Container(
                      height: SizeConfig.h(6),
                      width: SizeConfig.w(26),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: colors.onboardingRectangle,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(width: SizeConfig.w(178)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: AppColors.oliveGreen,
                        shadowColor: AppColors.armyGreen,
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                      ),

                      onPressed: () {
                        GoRouter.of(context).push('/NavicationBar');
                      },
                      child: Ink(
                        height: SizeConfig.h(45),
                        width: SizeConfig.w(125),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [AppColors.greenWithShade, AppColors.beige],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: AppTextStyles.smallOliveGreenStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
