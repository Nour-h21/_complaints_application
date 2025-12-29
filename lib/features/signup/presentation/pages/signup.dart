import 'package:complaints_application/core/constants/colors/colors.dart';
import 'package:complaints_application/core/constants/layout/app_space.dart';
import 'package:complaints_application/core/constants/styles/text_styles.dart';

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

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController name = TextEditingController();

  final TextEditingController emailOrPhone = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController comfirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isUpdating = false;

  @override
void initState() {
  super.initState();

  emailOrPhone.addListener(() {
    if (_isUpdating) return;

    String text = emailOrPhone.text;

    // إذا إيميل → لا تعمل شي
    if (text.contains('@')) return;

    // إذا بلش بأرقام
    if (RegExp(r'^[0-9]').hasMatch(text)) {
      if (!text.startsWith('+963')) {
        _isUpdating = true;

        emailOrPhone.text = '+963$text';
        emailOrPhone.selection = TextSelection.fromPosition(
          TextPosition(offset: emailOrPhone.text.length),
        );

        _isUpdating = false;
      }
    }
  });
}

@override
void dispose() {
  name.dispose();
  emailOrPhone.dispose();
  password.dispose();
  comfirmPassword.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            width: SizeConfig.w(330),
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
                      AppTexts.signup,
                      style: AppTextStyles.medwhiteStyle,
                    ),
      
                    AppSpaces.verticalTiny,
      
                    Text(
                      AppTexts.createAccounts,
                      style: TextStyle(color:AppColors.primaryColor),
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
  controller: emailOrPhone,
  hint: AppTexts.emailOrPhone,
  icon: Icons.email,
  // keyboardType: TextInputType.emailAddress,
  // prefixText: "+963 ",
  validator: AuthValidator.emailOrPhoneValidator,
),
                    AppSpaces.verticalSmall,
      
                    TextFieldInput(
                      controller: password,          // ✔
                      hint: AppTexts.password,
                      // icon: Icons.password,
                      isPassword: true,
                      validator: AuthValidator.passwordValidator,
      
                    ),
                    AppSpaces.verticalSmall,
      
                    TextFieldInput(
                      controller: comfirmPassword,   // ✔
                      hint: AppTexts.comfirmPassword,
                      // icon: Icons.password,
                      isPassword: true,
                      validator: (value) =>
                            AuthValidator.confirmPasswordValidator(
                              value,
                              password.text,
                            ),
                    ),
      
                    AppSpaces.verticalLarge,
      
                    GradientElevatedButton(
                      text: AppTexts.signup,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignupBloc>().add(
                            SubmitSignupEvent(
                              name: name.text,
                              emailOrPhone: emailOrPhone.text,
                              password: password.text,
                              confirmPassword: comfirmPassword.text,
                            ),
                          );
                        }
                      },
                    ),
      
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SizedBox(width: SizeConfig.w(2)),
                    //     TextButton(
                    //       onPressed: () {
                    //         GoRouter.of(context).go('/logIn');
                    //       },
                    //       child: Text(
                    //       AppTexts.nosignup ,
                    //        style: AppTextStyles.smallwhiteStyle ),
                    //     ),
                    //   ],
                    // ),
      
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppTexts.haveAccount, style: AppTextStyles.smallBlackStyle),
                        SizedBox(width: SizeConfig.w(2)),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/logIn');
                          },
                          child: Text(
                            AppTexts.nosignup,
                            style: AppTextStyles.smallwhiteStyle,
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
      ),
    );
  }
}