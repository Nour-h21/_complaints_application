import 'package:dio/dio.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repositry.dart';
import '../datasources/login_remote_ds.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDs remote;
  

  LoginRepositoryImpl(this.remote);

  @override
  Future<LoginEntity> login({
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      final body = {
        "emailOrPhone": emailOrPhone,
        "password": password,
      };

        return await remote.login(body);
    } on DioException catch (e) {

       final responseData = e.response?.data;
  
  // الأولوية لـ errors إذا موجود
  if (responseData != null && responseData["errors"] != null) {
    final errors = responseData["errors"];
    if (errors is List && errors.isNotEmpty) {
      // نأخذ أول خطأ في القائمة
      final error =errors[0].toString();
      if (error == "User information does not with our record.") {
        throw Exception("معلومات تسجيل الدخول غير صحيحة");
      }

      if (error == "يجب تفعيل الحساب عبر رمز التحقق قبل تسجيل الدخول.") {
        throw Exception("الحساب غير مفعل، يجب تفعيل الحساب عبر رمز التحقق قبل تسجيل الدخول.");
      }

      if (error == "User not found.") {
        throw Exception("المستخدم غير موجود");
      }

      if (error == "Too many login attempts") {
        throw Exception("تم تجاوز عدد محاولات الدخول المسموح بها ، الرجاء المحاولة لاحقاً");
      }

      if (error == "الحساب مقفل مؤقتاً بسبب محاولات دخول فاشلة متكررة.") {
        throw Exception("الحساب مقفل مؤقتاً بسبب محاولات دخول فاشلة متكررة");
      }
    }
  }
  
      final msg = e.response?.data["message"] ?? "حدث خطأ غير متوقع";
  
      throw Exception(msg);
    }
  }
}
