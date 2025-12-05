import 'package:complaints_application/core/constants/layout/app_space.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/strings/texts.dart';
import '../../../../core/shared/widgets/gradient_elevated_button.dart';
import '../../../../core/shared/widgets/card_image_on_glass.dart';
import '../../../../core/shared/widgets/text_field_input.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../../../../core/utils/validators/auth_validator.dart';
import '../bloc/signup_bloc.dart';
import '../bloc/signup_event.dart';
import '../bloc/signup_state.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController emailOrPhone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController comfirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupLoading) {
            // show loading
          } else if (state is SignupFailed) {
            // show error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
              
            );
            print(state.message);
          } else if (state is SignupSuccess) {
            GoRouter.of(context).go('/verification_code');
          }
        },
        child: CardImageOnGlass(
          width: 330,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _formKey,   // ✔ ربط الفورم
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpaces.verticalSmall,

                  Text(
                    "إنشاء حساب",
                    style: TextStyle(
                      fontSize: SizeConfig.sp(22),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  AppSpaces.verticalTiny,

                  const Text(
                    "أهلاً بك ، قم بإنشاء حسابك الآن",
                    style: TextStyle(color: Colors.white70),
                  ),

                  AppSpaces.verticalMedSmall,

                  TextFieldInput(
                    controller: name,              // ✔ ربط الكونترولر
                    hint: AppTexts.name,
                    icon: Icons.person,
                    validator: AuthValidator.nameValidator,
                  ),
                  AppSpaces.verticalSmall,

                  TextFieldInput(
                    controller: emailOrPhone,      // ✔
                    hint: AppTexts.emailOrPhone,
                    icon: Icons.email,
                    validator: AuthValidator.emailOrPhoneValidator,
                  ),
                  AppSpaces.verticalSmall,

                  TextFieldInput(
                    controller: password,          // ✔
                    hint: AppTexts.password,
                    icon: Icons.password,
                    isPassword: true,
                    validator: AuthValidator.passwordValidator,

                  ),
                  AppSpaces.verticalSmall,

                  TextFieldInput(
                    controller: comfirmPassword,   // ✔
                    hint: AppTexts.comfirmPassword,
                    icon: Icons.password,
                    isPassword: true,
                    validator: (value) =>
                          AuthValidator.confirmPasswordValidator(
                            value,
                            password.text,
                          ),
                  ),

                  AppSpaces.verticalLarge,

                  GradientElevatedButton(
                    text: "إنشاء حساب",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<SignupBloc>().add(
                          SubmitSignupEvent(
                            name: name.text.trim(),
                            emailOrPhone: emailOrPhone.text.trim(),
                            password: password.text.trim(),
                            confirmPassword: comfirmPassword.text.trim(),
                          ),
                        );
                      }
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: SizeConfig.w(2)),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).go('/logIn');
                        },
                        child: Text(AppTexts.nosignup),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}