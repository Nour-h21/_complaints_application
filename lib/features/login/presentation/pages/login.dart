import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/constants/strings/texts.dart';
import '../../../../core/shared/widgets/gradient_elevated_button.dart';
import '../../../../core/shared/widgets/card_image_on_glass.dart';
import '../../../../core/shared/widgets/text_field_input.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../../../../core/utils/validators/auth_validator.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailOrPhone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            // show loading
          } else if (state is LoginFailed) {
            // show error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is LoginSuccess) {
            GoRouter.of(context).go('/verification_code');
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
              
                  Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontSize: SizeConfig.sp(22),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              
                  AppSpaces.verticalTiny,
              
                  const Text(
                    "أهلاً بك، قم بتسجيل الدخول إلى حسابك",
                    style: TextStyle(color: Colors.white70),
                  ),
              
                  AppSpaces.verticalMedSmall,
              
                  TextFieldInput(
                    hint: "إيميل أو رقم الموبايل",
                    icon: Icons.email,
                    controller: emailOrPhone,
                    validator: AuthValidator.emailOrPhoneValidator,
                  ),
                  AppSpaces.verticalSmall,
              
                  TextFieldInput(
                    hint: "كلمة السر",
                    icon: Icons.password,
                    isPassword: true,
                    controller: password,
                    validator: AuthValidator.passwordValidator,
                  ),
              
                  AppSpaces.verticalLarge,
              
                  GradientElevatedButton(
                    text: "سجل دخول",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(
                            SubmitLoginEvent(
                              emailOrPhone: emailOrPhone.text.trim(),
                              password: password.text.trim(),
                            ),
                          );
                        }
                      },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(AppTexts.noAccount, style: AppTextStyles.plStyle),
                      SizedBox(width: SizeConfig.w(2)),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).go('/register');
                        },
                        child: Text(
                          AppTexts.nologin,
                          // style: AppTextStyles.buttonAuthNoAcountStyle,
                        ),
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
