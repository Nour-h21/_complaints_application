class AuthValidator {

   static String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "الاسم مطلوب";
    }

    value = value.trim();

    if (value.length < 3) {
      return "الاسم يجب أن يكون 3 أحرف على الأقل";
    }

    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return "الاسم يجب أن يحتوي على أحرف فقط";
    }

    return null; 
  }



   static String? emailOrPhoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "هذا الحقل مطلوب";
    }

    value = value.trim();

    if (value.contains('@')) {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      if (!emailRegex.hasMatch(value)) {
        return "البريد الإلكتروني غير صحيح";
      }

      if (value.split('@')[1].split('.').first.length < 2) {
        return "اسم النطاق في البريد غير صالح";
      }

      return null;
    }

   

    value = value.replaceAll(" ", "");

    if (value.startsWith("+963")) {
      value = value.replaceFirst("+963", "0");
    }

    if (value.startsWith("963")) {
      value = value.replaceFirst("963", "0");
    }

    final phoneRegex = RegExp(r'^09[0-9]{8}$');

    if (!phoneRegex.hasMatch(value)) {
      return "رقم الموبايل غير صحيح (يجب أن يكون مثل 09xxxxxxxx)";
    }

    return null;
  }


  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "كلمة السر مطلوبة";
    }

    if (value.length < 8) {
      return "كلمة السر يجب أن لا تقل عن 8 أحرف";
    }

    // final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

    // if (!regex.hasMatch(value)) {
    //   return "يجب أن تحتوي كلمة السر على أحرف وأرقام";
    // }

    return null; 
  }


  static String? confirmPasswordValidator(String? value, String passwordValue) {
    if (value == null || value.trim().isEmpty) {
      return "يرجى تأكيد كلمة السر";
    }

    if (value != passwordValue) {
      return "كلمة السر غير متطابقة";
    }

    return null;
  }
  
}