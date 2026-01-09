import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/colors/colors.dart';
import '../../constants/urls/assets_url.dart';
import '../../utils/helpers/size_config.dart';
import '../pages/gradient_background.dart';
import 'frosted_glass_card.dart';

class CardImageOnGlass extends StatelessWidget {
  final Widget child;
  final double width;
  final bool showBackButton; // أضفت هذا المتغير لجعله اختيارياً

  const CardImageOnGlass({
    super.key, 
    required this.child, 
    required this.width,
    this.showBackButton = true, // افتراضياً يظهر، يمكنك إلغاؤه عند الحاجة
  });

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return Stack(
      alignment: Alignment.center,
      children: [
        // 1. الخلفية الملونة
        GradientBackground(),
        
        // 2. المحتوى (اللوغو والكرت)
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: FrostedGlassCard(width: width, child: child),
                  ),
                  Container(
                    height: SizeConfig.w(90),
                    width: SizeConfig.w(90),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppAssets.logoWithoutBackground),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // 3. زر الرجوع (يتم وضعه هنا ليكون فوق كل شيء وفي الزاوية)
        if (showBackButton)
          Directionality(
            textDirection: TextDirection.ltr,
            child: Positioned(
              top: 10, // المسافة من الأعلى
              left: 10, // المسافة من اليسار (بما أنك تستخدم LTR)
              child: isIos
                  ? CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (context.canPop()) {
                    context.pop(); // يرجع للصفحة السابقة
                  } else {
                    context.pushReplacement('/logIn'); // إذا لم يوجد سجل يذهب لتسجيل الدخول
                  }
                      },
                      child: Icon(Icons.arrow_back_ios, color: AppColors.beige),
                    )
                  : IconButton(
                      onPressed: () {
                         if (context.canPop()) {
                    context.pop(); // يرجع للصفحة السابقة
                  } else {
                    context.pushReplacement('/logIn'); // إذا لم يوجد سجل يذهب لتسجيل الدخول
                  }
                      },
                      icon: Icon(Icons.arrow_back, color: AppColors.beige),
                    ),
              
              
              
              // IconButton(
              //   onPressed: () {
              //     if (context.canPop()) {
              //       context.pop(); // يرجع للصفحة السابقة
              //     } else {
              //       context.pushReplacement('/logIn'); // إذا لم يوجد سجل يذهب لتسجيل الدخول
              //     }
              //   },
              //   icon: Icon(
              //     Icons.arrow_back, 
              //     color: AppColors.beige, // تأكد من تعريف هذا اللون في AppColors
              //     size: 30,
              //   ),
              // ),
            ),
          ),
      ],
    );
  }
}
