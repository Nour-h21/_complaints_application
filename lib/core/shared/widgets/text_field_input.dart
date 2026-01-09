import 'package:complaints_application/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:complaints_application/core/constants/layout/app_padding.dart';
import 'package:complaints_application/core/constants/layout/app_radius.dart';

import '../../Theme/app_colors.dart';
import '../../utils/helpers/size_config.dart';

class TextFieldInput extends StatefulWidget {
  final String hint;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? prefixText;

  const TextFieldInput({
    super.key,
    required this.hint,
     this.icon,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.prefixText,
  });

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // 👇 تهيئة الحالة فقط
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsTheme>()!;
    return Container(
      padding: AppPadding.symmetricHorizontalSmall,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.4)),
        borderRadius: AppRadius.circularSmall,
        color: Colors.white.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              validator: widget.validator,

              /// ✅ المكان الصحيح
              obscureText: widget.isPassword ? _obscureText : false,

              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixText: widget.prefixText,
                border: InputBorder.none,
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: colors.hindTextFieldInput,
                  fontSize: SizeConfig.sp(14),
                ),
              ),
            ),
          ),

          /// 👇 مساحة أيقونة ثابتة
          SizedBox(
            width: SizeConfig.w(40),
            child: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                      // color: Colors.white70,
                      color: AppColors.oliveGreen.withOpacity(0.88),
                      size: SizeConfig.w(22.5),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.icon != null
                    ? Icon(
                        widget.icon,
                        // color: Colors.white70,
                         color: AppColors.oliveGreen.withOpacity(0.88),
                        size: SizeConfig.w(22.5),
                      )
                    : const SizedBox(),
          ),
        ],
      ),
    );
  }
}