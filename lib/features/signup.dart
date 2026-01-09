import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// ======================
/// SIGNUP SCREEN (LIGHT)
/// ======================

class SignupLight extends StatelessWidget {
  SignupLight({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController emailOrPhone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GradientBackground(
          child: Center(
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: 330,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 10),

                              /// Title
                              const Text(
                                'إنشاء حساب',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),

                              const SizedBox(height: 6),

                              const Text(
                                'أنشئ حسابك الجديد',
                                style: TextStyle(
                                  color: Color(0xFF2D6A4F),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const SizedBox(height: 20),

                              /// Name
                              LightTextField(
                                controller: name,
                                hint: 'الاسم الكامل',
                                icon: Icons.person,
                              ),

                              const SizedBox(height: 12),

                              /// Email / Phone
                              LightTextField(
                                controller: emailOrPhone,
                                hint: 'البريد الإلكتروني أو الهاتف',
                                icon: Icons.email,
                              ),

                              const SizedBox(height: 12),

                              /// Password
                              LightTextField(
                                controller: password,
                                hint: 'كلمة المرور',
                                icon: Icons.lock,
                                isPassword: true,
                              ),

                              const SizedBox(height: 12),/// Confirm Password
                              LightTextField(
                                controller: confirmPassword,
                                hint: 'تأكيد كلمة المرور',
                                icon: Icons.lock,
                                isPassword: true,
                              ),

                              const SizedBox(height: 25),

                              /// Signup Button
                              GradientElevatedButton(
                                text: 'تسجيل',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Bloc / API later
                                  }
                                },
                              ),

                              const SizedBox(height: 18),

                              /// Login
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'لديك حساب؟',
                                    style: TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      GoRouter.of(context).go('/logIn');
                                    },
                                    child: const Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                        color: Color(0xFF2D6A4F),
                                        fontWeight: FontWeight.bold,
                                      ),
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

                  /// Avatar
                  Container(
                    height: 90,
                    width: 90,
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
            ),
          ),
        ),
      ),
    );
  }
}

/// ======================
/// GRADIENT BACKGROUND
/// ======================

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Color.fromARGB(255, 226, 227, 225),
            // Color.fromARGB(255, 192, 204, 185),
            // Color.fromARGB(255, 133, 146, 127),

            Color.fromARGB(255, 210, 215, 203),
            Color.fromARGB(255, 160, 172, 153),
            Color.fromARGB(255, 108, 120, 102),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

/// ======================
/// TEXT FIELD (LIGHT)
/// ======================

class LightTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isPassword;

  const LightTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });@override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: (value) =>
          value == null || value.isEmpty ? 'هذا الحقل مطلوب' : null,
      decoration: InputDecoration(
        filled: true,
        // fillColor: Colors.grey.shade100,
        fillColor: Colors.white.withOpacity(0.4),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        prefixIcon: Icon(icon, color: const Color(0xFF2D6A4F)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        // border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 69, 134, 31),width: 0.01),borderRadius:BorderRadius.circular(12) )
      ),
      style: const TextStyle(color: Colors.black87),
    );
  }
}

/// ======================
/// GRADIENT BUTTON (LIGHT)
/// ======================

class GradientElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient:  LinearGradient(
              // colors: [
              //   Color(0xFFDFF2E1),
              //   Color(0xFFBFE3C6),
              // ],
               colors: [ 
              //   Color.fromARGB(255, 236, 233, 203), 
              //  const Color.fromARGB(255, 163, 188, 163)
              //  Color.fromARGB(255, 222, 219, 189),
               Color.fromARGB(255, 236, 232, 198),
               const Color.fromARGB(255, 137, 158, 137)],
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Center(
              child: Text(
                'تسجيل',
                style: TextStyle(
                  color: Color(0xFF1B4332),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}