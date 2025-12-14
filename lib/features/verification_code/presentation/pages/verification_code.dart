import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/constants/strings/texts.dart';
import '../../../../core/shared/widgets/card_image_on_glass.dart';
import '../../../../core/shared/widgets/gradient_elevated_button.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../../resend_otp/presentation/bloc/resendotp_bloc/resend_otp_bloc.dart';
import '../../verify_otp/presentation/bloc/verifyotp_bloc/otp_bloc.dart';
import '../../verify_otp/presentation/bloc/verifyotp_bloc/otp_event.dart';
import '../../verify_otp/presentation/bloc/verifyotp_bloc/otp_state.dart';

class VerificationCode extends StatelessWidget {
  VerificationCode({super.key});

  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is OtpLoading) {
            // يمكن إضافة Loading Indicator
          } else if (state is OtpFailed) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is OtpSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            GoRouter.of(context).go('/logIn'); // توجيه بعد التفعيل
          }
        },
        child: CardImageOnGlass(
          width: 330,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpaces.verticalSmall,
                  AppSpaces.verticalTiny,
                  Text(
                    AppTexts.verificationCode,
                    style: TextStyle(
                      fontSize: SizeConfig.sp(22),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpaces.verticalTiny,
                  Text(
                    AppTexts.enterVerificationCode,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: SizeConfig.sp(16),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  AppSpaces.verticalMedSmall,
                  AppSpaces.verticalMedSmall,

                  // حقل OTP
                  SizedBox(
                    width: SizeConfig.w(330),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        textStyle: TextStyle(
                          color: AppColors.oliveGreen,
                          fontSize: SizeConfig.sp(25),
                          fontWeight: FontWeight.bold,
                        ),
                        cursorColor: Colors.white,
                        animationType: AnimationType.scale,
                        animationDuration: const Duration(milliseconds: 180),
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(15),
                          fieldHeight: SizeConfig.h(52),
                          fieldWidth: SizeConfig.w(42),  
                          inactiveColor: Colors.transparent,
                          selectedColor: Colors.transparent,
                          activeColor: Colors.transparent,
                          borderWidth: 0,
                          inactiveFillColor: AppColors.armyGreen2.withOpacity(
                            0.4,
                          ),
                          activeFillColor: AppColors.beige.withOpacity(0.35),
                          selectedFillColor: AppColors.armyGreen2.withOpacity(
                            0.4,
                          ),
                        ),
                        enableActiveFill: true,
                        onChanged: (value) {},
                      ),
                    ),
                  ),

                  AppSpaces.verticalLarge,

                  GradientElevatedButton(
                    onPressed: () {
                      final otpCode = otpController.text.trim();
                      if (otpCode.length == 6) {
                        context.read<OtpBloc>().add(
                          SubmitOtpEvent(otp: otpCode),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("الرجاء إدخال رمز OTP صالح")),
                        );
                      }
                    },
                    text: AppTexts.verification,
                  ),

                  SizedBox(height: SizeConfig.h(5)),
// BlocBuilder<ResendOtpBloc, ResendOtpState>(
//   builder: (context, state) {
//     return TextButton(
//       onPressed: state.canResend
//           ? () {
//               context.read<ResendOtpBloc>().add(ResendPressedEvent());
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(
//                     "تم إرسال الرمز مجدداً",
//                     textDirection: TextDirection.rtl,
//                   ),
//                   backgroundColor: Colors.white.withOpacity(0.45),
//                 ),
//               );
//             }
//           : null, // معطل أثناء العد
//       child: Text(
//         state.canResend
//             ? "إعادة إرسال الرمز"
//             : "انتظر ${state.secondsRemaining} ثانية",
//         style: TextStyle(
//           color: state.canResend
//               ? Colors.white.withOpacity(0.95)
//               : Colors.grey,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   },
// )

BlocBuilder<ResendOtpBloc, ResendOtpState>(
  builder: (context, state) {
    return TextButton(
      onPressed: state.canResend
          ? () {
              context.read<ResendOtpBloc>().add(ResendPressedEvent());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "تم إرسال الرمز مجدداً",
                    textDirection: TextDirection.rtl,
                  ),
                  backgroundColor: Colors.white.withOpacity(0.45),
                ),
              );
            }
          : null,
      child: Text(
        state.canResend
            ? "إعادة إرسال الرمز"
            : "انتظر ${state.secondsRemaining} ثانية",
        style: TextStyle(
          color: state.canResend
              ? Colors.white.withOpacity(0.95)
              : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  },
),
                  // BlocBuilder<ResendOtpBloc, ResendOtpState>(
                  //   builder: (context, state) {
                  
                  //         return TextButton(
                  //           onPressed: () {
                  //             if (state.canResend) {
                  //               context.read<ResendOtpBloc>().add(
                  //                 StartTimerEvent(),
                  //               );
                  //               context.read<ResendOtpBloc>().add(ResendPressedEvent());
                  //               ScaffoldMessenger.of(context).showSnackBar(
                  //                 SnackBar(
                  //                   content: Text(
                  //                     "تم إرسال الرمز مجدداً",
                  //                     textDirection: TextDirection.rtl,
                  //                   ),
                  //                   backgroundColor: Colors.white.withOpacity(
                  //                     0.45,
                  //                   ),
                  //                 ),
                  //               );
                  //             } else {
                  //               ScaffoldMessenger.of(context).showSnackBar(
                  //                 SnackBar(
                  //                   content: Text(
                  //                     "انتظر ${state.secondsRemaining} ثانية",
                  //                     textDirection: TextDirection.rtl,
                  //                   ),
                  //                   backgroundColor: Colors.white.withOpacity(
                  //                     0.45,
                  //                   ),
                  //                 ),
                  //               );
                  //             }
                  //           },
                  //           child: Center(
                  //             child: Text(
                  //               state.canResend
                  //                   ? AppTexts.returnOtp
                  //                   : "إعادة إرسال الرمز (${state.secondsRemaining})",
                  //               style: TextStyle(
                  //                 color: state.canResend
                  //                     ? Colors.white.withOpacity(0.95)
                  //                     : AppColors.primaryColor,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     )
                    
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
