import 'package:flutter/material.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/utils/helpers/size_config.dart';



class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType keyboardType;
  final int? minLines;
  final int? maxLines;
  final bool isRequired;
  final bool enabled;
  final double width;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.minLines,
    this.maxLines,
    this.isRequired = true,
    this.enabled = true,
    required this.width,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          cursorColor: AppColors.primaryColor,
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            labelText: label,
            labelStyle:  AppTextStyles.verySmallWhite70Style,
            hintText: hint,
            hintStyle:  AppTextStyles.verySmallWhite70Style,
            border: OutlineInputBorder(
               borderRadius:AppRadius.circularVeryMedium,
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.1),
                  width:SizeConfig.w(2)
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:AppRadius.circularVeryMedium,
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.1),
                 width:SizeConfig.w(2)
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:AppRadius.circularVeryMedium,
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.1),
                 width:SizeConfig.w(2)
              ),
            ),
          ),
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: maxLines,
          validator:
              validator ??
              (value) {
                if (!enabled) return null;
                if (value == null || value.trim().isEmpty) {
                  return 'الرجاء إدخال $label';
                }

                return null;
              },
        ),
      ),
    );
  }
}
