import 'package:flutter/material.dart';

import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/layout/app_radius.dart';
import '../../../../core/constants/styles/text_styles.dart';
import '../../../../core/utils/helpers/size_config.dart';


class DropdownButtonField extends StatelessWidget {
  final String label;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String>? validator;
  final String? errorText;

  const DropdownButtonField({
    super.key,
    required this.label,
    required this.options,
    required this.onChanged,
    this.errorText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.4)),
        borderRadius: AppRadius.circularVeryMedium,
        color: Colors.white.withOpacity(0.1),
      ),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        dropdownColor: AppColors.primaryColor,
        borderRadius: AppRadius.circularVeryMedium,
        iconEnabledColor: AppColors.yellow,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppTextStyles.verySmallWhite70Style,
          border: OutlineInputBorder(
            borderRadius: AppRadius.circularVeryMedium,
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: SizeConfig.w(2)
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
            borderRadius: AppRadius.circularVeryMedium,
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: SizeConfig.w(2)
            ),
          ),
        ),
        items: options
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: AppTextStyles.verySmallBlackStyle,
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        validator:
            validator ??
            (value) {
              if (value == null || value.trim().isEmpty) {
                return 'الرجاء إدخال $label';
              }
              return null;
            },
      ),
    );
  }
}
