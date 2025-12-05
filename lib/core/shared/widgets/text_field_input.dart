import 'package:complaints_application/core/constants/layout/app_padding.dart';
import 'package:complaints_application/core/constants/layout/app_radius.dart';
import 'package:flutter/material.dart';

import '../../utils/helpers/size_config.dart';

class TextFieldInput extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;

  const TextFieldInput({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.validator,
    this.keyboardType,
    this.isPassword = false,});

  @override
  Widget build(BuildContext context) {
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
              controller: controller,
              keyboardType: keyboardType,
              validator: validator,
              obscureText: isPassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: SizeConfig.sp(13.5),
                ),
              ),
            ),
          ),
          Icon(
            icon,
            color: Colors.white70,
            size: SizeConfig.w(22.5),
          ),
        ],
      ),
    );
  }
}