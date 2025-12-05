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
      final msg = e.response?.data["message"] ?? "حدث خطأ غير متوقع";

      if (msg == "User information does not with our record.") {
        throw Exception("معلومات تسجيل الدخول غير صحيحة");
      }

      if (msg == "يجب تفعيل الحساب عبر رمز التحقق قبل تسجيل الدخول.") {
        throw Exception("الحساب غير مفعل، يجب تفعيل الحساب عبر رمز التحقق قبل تسجيل الدخول.");
      }

      if (msg == "User not found.") {
        throw Exception("المستخدم غير موجود");
      }

      throw Exception(msg);
    }
  }
}
