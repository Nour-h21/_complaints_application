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
        autovalidateMode:AutovalidateMode.onUserInteraction,
        isExpanded: true,
        dropdownColor: AppColors.primaryColor,
        borderRadius: AppRadius.circularVeryMedium,
        iconEnabledColor: AppColors.oliveGreen,
        decoration: InputDecoration(
         
          labelText: label,
          labelStyle: AppTextStyles.smallBeigeStyle,
          border: OutlineInputBorder(
            borderRadius: AppRadius.circularVeryMedium,
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: SizeConfig.w(2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppRadius.circularVeryMedium,
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: SizeConfig.w(2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppRadius.circularVeryMedium,
            borderSide: BorderSide(
               color: Colors.white.withOpacity(0.1),
              width: SizeConfig.w(2),
            ),
          ),
           errorBorder: OutlineInputBorder( 
              borderRadius: AppRadius.circularVeryMedium,
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          errorStyle:  TextStyle( 
              color: Colors.red,
              fontSize: 12,
              height: 1,
            ),
        ),
        items: options
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e, style: AppTextStyles.smallOliveGreenStyle),
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


// class DropdownButtonField extends StatelessWidget {
//   final String label;
//   final List<String> options;
//   final String? value; // ✅ القيمة الابتدائية
//   final ValueChanged<String?>? onChanged;
//   final FormFieldValidator<String>? validator;
//   final String? errorText;
//   final bool enabled; // ✅ قراءة فقط

//   const DropdownButtonField({
//     super.key,
//     required this.label,
//     required this.options,
//     required this.onChanged,
//     this.value,
//     this.errorText,
//     this.validator,
//     this.enabled = true, // افتراضياً مفعل
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.white.withOpacity(0.4)),
//         borderRadius: AppRadius.circularVeryMedium,
//         color: enabled
//             ? Colors.white.withOpacity(0.1)
//             : Colors.white.withOpacity(0.05), // شكل disabled
//       ),
//       child: DropdownButtonFormField<String>(
//         value: value, // ✅ هون المفتاح
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         isExpanded: true,
//         dropdownColor: AppColors.primaryColor,
//         borderRadius: AppRadius.circularVeryMedium,
//         iconEnabledColor:
//             enabled ? AppColors.oliveGreen : Colors.grey,
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: AppTextStyles.smallBeigeStyle,
//           enabled: enabled, // ✅ تعطيل كامل
//           border: OutlineInputBorder(
//             borderRadius: AppRadius.circularVeryMedium,
//             borderSide: BorderSide(
//               color: Colors.white.withOpacity(0.1),
//               width: SizeConfig.w(2),
//             ),
            
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: AppRadius.circularVeryMedium,
//              borderSide: BorderSide(
//               color: Colors.white.withOpacity(0.1),
//               width: SizeConfig.w(2),
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: AppRadius.circularVeryMedium,
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: AppRadius.circularVeryMedium,
//             borderSide: const BorderSide(color: Colors.red),
//           ),
//           errorStyle: const TextStyle(
//             color: Colors.red,
//             fontSize: 12,
//             height: 1,
//           ),
//         ),
//         items: options
//             .map(
//               (e) => DropdownMenuItem(
//                 value: e,
//                 child: Text(
//                   e,
//                   style: AppTextStyles.smallOliveGreenStyle,
//                 ),
//               ),
//             )
//             .toList(),
//         onChanged: enabled ? onChanged : null, // ✅ سر القراءة فقط
//         validator: enabled
//             ? validator ??
//                 (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'الرجاء إدخال $label';
//                   }
//                   return null;
//                 }
//             : null,
//       ),
//     );
//   }
// }