import 'package:flutter/widgets.dart';

import '../../utils/helpers/size_config.dart';
import '../pages/gradient_background.dart';
import 'frosted_glass_card.dart';

class CardImageOnGlass extends StatelessWidget {
  final Widget child;
  final double width;

  const CardImageOnGlass({super.key, required this.child, required this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(

      alignment: Alignment.center,
      children: [
        GradientBackground(),
    
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/image2jpg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// CardImageOnGlass( 
//         width: 330,
//         child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AppSpaces.verticalMedium,
      
//             Text(
//               "إنشاء حساب",
//               style: TextStyle(
//                 fontSize: SizeConfig.sp(22),
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
      
//             AppSpaces.verticalSmall,
      
//             const Text(
//               "أهلاً بك ، قم بإنشاء حسابك الآن",
//               style: TextStyle(color: Colors.white70),
//             ),
      
//             AppSpaces.verticalLarge,
      
//             TextFieldInput(hint: "اسم المستخدم", icon: Icons.person),
//             AppSpaces.verticalMedium,
      
//             TextFieldInput(hint: "إيميل أو رقم الموبايل", icon: Icons.email),
//             AppSpaces.verticalMedium,
      
//             TextFieldInput(hint: "كلمة السر", icon: Icons.lock, isPassword: true),
//             AppSpaces.verticalMedium,
      
//             TextFieldInput(hint: "تأكيد كلمة السر", icon: Icons.lock, isPassword: true),
      
//             AppSpaces.verticalLargeLarge,
      
//             GradientElevatedButton(
//               text: "إنشاء حساب",
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//           ),