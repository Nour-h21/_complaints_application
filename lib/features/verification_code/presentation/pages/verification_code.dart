import 'package:complaints_application/core/constants/layout/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/constants/strings/texts.dart';
import '../../../../core/constants/styles/text_styles.dart';
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
    return SafeArea(
      child: Scaffold(
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
              ).showSnackBar(SnackBar(content: Text(state.message),backgroundColor: AppColors.primaryColor1.withOpacity(0.45),));
              GoRouter.of(context).go('/NavicationBar'); // توجيه بعد التفعيل
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
                      style: AppTextStyles.medwhiteStyle
                    ),
                    AppSpaces.verticalTiny,
                    Text(
                      AppTexts.enterVerificationCode,
                      style: AppTextStyles.medWhite70Style,//no fontWeight
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
                          textStyle: AppTextStyles.medOliveGreenStyle,
                          cursorColor: AppColors.primaryColor1,
                          animationType: AnimationType.scale,
                          animationDuration: const Duration(milliseconds: 180),
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: AppRadius.circularSmall,
                            fieldHeight: SizeConfig.h(52),
                            fieldWidth: SizeConfig.w(42),
                            inactiveColor: AppColors.transparent,
                            selectedColor: AppColors.transparent,
                            activeColor: AppColors.transparent,
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
                            SnackBar(content: Text(AppTexts.noteVerificationCode)),
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
      
                    // BlocBuilder<ResendOtpBloc, ResendOtpState>(
                    //   builder: (context, state) {
                    //     return TextButton(
                    //       onPressed: state.canResend
                    //           ? () {
                    //               context.read<ResendOtpBloc>().add(ResendPressedEvent());
                    //               // 2) إعادة تشغيل عداد الـ BLoC
                    //               // context.read<ResendOtpBloc>().add(StartTimerEvent());
                    //               ScaffoldMessenger.of(context).showSnackBar(
                    //                 SnackBar(
                    //                   content: Text(
                    //                     AppTexts.returnOtp,
                    //                     textDirection: TextDirection.rtl,
                    //                   ),
                    //                   backgroundColor: AppColors.primaryColor1.withOpacity(0.45),
                    //                 ),
                    //               );
                    //             }
                    //           : null,
                    //       child: Text(
                    //         state.canResend
                    //             ?  AppTexts.returnOtp
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
                    // ),

// BlocBuilder<ResendCodeBloc, ResendCodeState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               ElevatedButton(
//                 onPressed: state.isButtonEnabled
//                     ? () => context.read<ResendCodeBloc>().add(ResendCodePressedEvent())
//                     : null,
//                 child: const Text("Resend Code"),
//               ),
//               const SizedBox(height: 8),
//               Text("You can resend code in ${state.duration} seconds"),
//             ],
//           );
//         },
//       ),

BlocConsumer<ResendOtpBloc, ResendOtpState>(
  listener: (context, state) {
    if (state.successMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.successMessage!,
            textDirection: TextDirection.rtl,
          ),
          backgroundColor: AppColors.primaryColor1.withOpacity(0.45),
        ),
      );
    }

    if (state.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.errorMessage!,
            textDirection: TextDirection.rtl,
          ),
          backgroundColor: AppColors.greenWithShade,
        ),
      );
    }
  },
  builder: (context, state) {
    return TextButton(
      onPressed: state.isButtonEnabled && !state.isLoading
          ? () {
              context
                  .read<ResendOtpBloc>()
                  .add(ResendCodePressedEvent());
            }
          : null,
      child: state.isLoading
          // ? Text( "جاري الإرسال ..")
         ?  const SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(strokeWidth: 2,color: Colors.grey,),
            )
          : 
          Text(
              state.isButtonEnabled
                  ? "إعادة إرسال الرمز"
                  : "إعادة إرسال الرمز (${state.duration})",
              style: TextStyle(
                color: state.isButtonEnabled
                    ? Colors.white.withOpacity(0.95)
                    : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  },
),



// BlocConsumer<ResendOtpBloc, ResendOtpState>(
//   listener: (context, state) {
//     if (state.errorMessage != null) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(state.errorMessage!)));
//     }

//     if (state.successMessage != null) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(state.successMessage!)));
//     }
//   },
//   builder: (context, state) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: state.isButtonEnabled && !state.isLoading
//               ? () => context
//                   .read<ResendOtpBloc>()
//                   .add(ResendCodePressedEvent())
//               : null,
//           child: state.isLoading
//               ? const CircularProgressIndicator()
//               : const Text("إعادة إرسال الرمز"),
//         ),
//         const SizedBox(height: 8),
//         Text("إعادة الإرسال بعد ${state.duration} ثانية"),
//       ],
//     );
//   },
// ),

                    // BlocBuilder<ResendOtpBloc, ResendOtpState>(
                    //   builder: (context, state) {
                    //     return TextButton(
                    //       onPressed: () {
                    //         if (state.canResend) {
                    //           // 1) إرسال طلب إعادة OTP للسيرفر
                    //           context.read<ResendOtpBloc>().add(
                    //             ResendPressedEvent(),
                    //           );
      
                    //           // 2) إعادة تشغيل عداد الـ BLoC
                    //           context.read<ResendOtpBloc>().add(
                    //             StartTimerEvent(),
                    //           );
      
                    //           ScaffoldMessenger.of(context).showSnackBar(
                    //             SnackBar(
                    //               content: Text(
                    //                 AppTexts.sendOtp,
                    //                 textDirection: TextDirection.rtl,
                    //               ),
                    //               backgroundColor: AppColors.primaryColor1.withOpacity(0.45),
                    //             ),
                    //           );
                    //         } else {
                    //           ScaffoldMessenger.of(context).showSnackBar(
                    //             SnackBar(
                    //               content: Text(
                    //                 "انتظر ${state.secondsRemaining} ثانية",
                    //               ),
                    //               backgroundColor: AppColors.greenWithShade,
                    //             ),
                    //           );
                    //         }
                    //       },
                    //       child: Text(
                    //         state.canResend
                    //             ? AppTexts.returnOtp
                    //             : "إعادة إرسال الرمز (${state.secondsRemaining})",
                    //         style: TextStyle(
                    //           color: state.canResend
                    //               ? Colors.white.withOpacity(0.95)
                    //               : Colors.grey,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
      
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
      ),
    );
  }
}
