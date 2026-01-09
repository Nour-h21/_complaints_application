import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/constants/strings/texts.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/shared/widgets/card_image_on_glass.dart';
import '../../../../core/shared/widgets/gradient_elevated_button1.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../bloc/change_password_bloc.dart';
import '../bloc/change_password_event.dart';
import '../bloc/change_password_state.dart';

class CheckCode extends StatelessWidget {
  CheckCode({super.key});

  final TextEditingController code = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordLoading) {
              // show loading
            } else if (state is ChangePasswordFailed) {
              // show error
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              print('oooooooooo${state.message}');
            } else if (state is CheckCodeSuccess) {
              print('oolll');
              context.push('/resetPassword');
            }
          },
          child: CardImageOnGlass(
            width: 330,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpaces.verticalMedium,
                    // AppSpaces.verticalTiny,
                    Text(
                      AppTexts.verificationEmail,
                      style: AppTextStyles.bigOliveGreenStyle,
                    ),
                    AppSpaces.verticalTiny,
                    Text(
                      AppTexts.enterCode,
                      style: AppTextStyles.medWhite70WieghtStyle,
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
                          controller: code,
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

                    GradientElevatedButton1(
                      onPressed: () {
                        final otpCode = code.text.trim();
                        if (otpCode.length == 6) {
                          context.read<ChangePasswordBloc>().add(
                            CheckCodeEvent(code: otpCode),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(AppTexts.noteVerificationCode),
                            ),
                          );
                        }
                      },
                      text: AppTexts.verification,
                    ),
                    SizedBox(height: SizeConfig.h(5)),
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
