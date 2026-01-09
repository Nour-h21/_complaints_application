import 'package:complaints_application/core/constants/layout/app_space.dart';
import 'package:complaints_application/core/constants/styles/text_styles.dart';
import 'package:complaints_application/core/utils/validators/auth_validator.dart';
import 'package:complaints_application/features/change_password/presentation/bloc/change_password_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/strings/texts.dart';
import '../../../../core/shared/widgets/card_image_on_glass.dart';
import '../../../../core/shared/widgets/gradient_elevated_button1.dart';
import '../../../../core/shared/widgets/text_field_input.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../bloc/change_password_event.dart';
import '../bloc/change_password_state.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController email = TextEditingController();
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
            } else if (state is ForgotPasswordSuccess) {
              context.push('/checkCode');
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
                      AppTexts.enterEmail,
                      style: AppTextStyles.bigOliveGreenStyle,
                    ),

                    AppSpaces.verticalTiny,

                    Text(
                      AppTexts.enterEmailhint,
                      style: AppTextStyles.medWhite70WieghtStyle,
                    ),

                    AppSpaces.verticalSmall,
                    AppSpaces.verticalMedSmall,
                    TextFieldInput(
                      controller: email, // ✔ ربط الكونترولر
                      hint: AppTexts.email,
                      icon: Icons.email,
                      validator: AuthValidator.emailOrPhoneValidator,
                    ),
                    AppSpaces.verticalLarge,
                    // AppSpaces.verticalSmall,
                    GradientElevatedButton1(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ChangePasswordBloc>().add(
                            ForgotPasswordEvent(
                              email: email.text,
                            ),
                          );
                        }
                      },
                      text: AppTexts.confirmation,
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
