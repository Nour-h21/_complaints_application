import 'package:complaints_application/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/Theme/app_colors.dart';
import '../../../../core/constants/layout/app_space.dart';
import '../../../../core/constants/strings/texts.dart';
import '../../../../core/shared/widgets/card_image_on_glass.dart';
import '../../../../core/shared/widgets/gradient_elevated_button1.dart';
import '../../../../core/shared/widgets/text_field_input.dart';
import '../../../../core/utils/helpers/size_config.dart';
import '../../../../core/utils/validators/auth_validator.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailOrPhone = TextEditingController();

  final TextEditingController password = TextEditingController();

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
    emailOrPhone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsTheme>()!;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              // show loading
            } else if (state is LoginFailed) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is LoginSuccess) {
              GoRouter.of(context).go('/NavicationBar');
            } else if (state is LoginNotVerified) {
              // 👈 هنا يتم التوجيه التلقائي لواجهة OTP
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("الحساب غير مفعل، سيتم نقلك لتفعيل الحساب"),
                ),
              );

              // تحويل المستخدم لواجهة OTP مع تمرير الايميل/رقم الهاتف
              GoRouter.of(
                context,
              ).go('/verification_code', extra: state.emailOrPhone);
            }
          },
          child: CardImageOnGlass(
            width: SizeConfig.w(330), //330
            showBackButton:false,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpaces.verticalSmall,

                    Text(AppTexts.login, style: AppTextStyles.bigOliveGreenStyle,),

                    AppSpaces.verticalTiny,

                    Text(
                      AppTexts.welcomeb,
                      // style: TextStyle(color: AppColors.primaryColor),
                      style: AppTextStyles.medWhite70WieghtStyle,
                    ),

                    AppSpaces.verticalMedSmall,

                    TextFieldInput(
                      hint: AppTexts.emailOrPhone,
                      icon: Icons.email,
                      controller: emailOrPhone,
                      validator: AuthValidator.emailOrPhoneValidator,
                    ),
                    AppSpaces.verticalSmall,

                    TextFieldInput(
                      hint: AppTexts.password,
                      icon: Icons.password,
                      isPassword: true,
                      controller: password,
                      validator: AuthValidator.passwordValidator,
                    ),

                    // AppSpaces.verticalSmall,
                    // AppSpaces.verticalTiny,
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).go('/ForgotPassword');
                      },
                      child: Text(
                        AppTexts.forgotPassword,
                        style: AppTextStyles.smallOliveStyle,
                      ),
                    ),

                    AppSpaces.verticalSmall,

                    GradientElevatedButton1(
                      text: AppTexts.login,
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
                        Text(
                          AppTexts.noAccount,
                          // style: AppTextStyles.smallwhiteStyle,
                          style: TextStyle(color: colors.hindnoaccount),
                        ),
                        // SizedBox(width: SizeConfig.w(2)),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/register');
                          },
                          child: Text(
                            AppTexts.nologin,
                            style: AppTextStyles.smallOliveGreen2Style,
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
