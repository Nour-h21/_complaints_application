import '../../domain/entities/signup_entity.dart';
import '../../domain/repositories/signup_repository.dart';
import '../datasources/signup_remote_ds.dart';
import 'package:dio/dio.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDs remote;

  SignupRepositoryImpl(this.remote);

  @override
  Future<SignupEntity> signup({
    required String name,
    required String emailOrPhone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final body = {
        "name": name,
        "emailOrPhone": emailOrPhone,
        "password": password,
        "password_confirmation": confirmPassword,
      };

      print('ppppppppppppppppppppp$body');
      return await remote.signup(body);
    } on DioException catch (e) {
       final responseData = e.response?.data;
  
  // الأولوية لـ errors إذا موجود
  if (responseData != null && responseData["errors"] != null) {
    final errors = responseData["errors"];
    if (errors is List && errors.isNotEmpty) {
      // نأخذ أول خطأ في القائمة
      throw Exception(errors[0].toString());
    }
  }
  
  // إذا ما في errors، نجرب message
  final msg = responseData?["message"] ?? "حدث خطأ غير متوقع";
  
      print(msg);
      if (msg == "الرجاء إدخال بريد إلكتروني أو رقم هاتف صحيح") {
        throw Exception("الرجاء إدخال بريد إلكتروني أو رقم هاتف صحيح");
      }

      if (msg == "The password field confirmation does not match.") {
        throw Exception("تأكيد كلمة السر غير متطابق");
      }

      if (msg == "The email or phone has already been taken.") {
        throw Exception("البريد الإلكتروني أو رقم الموبايل مستخدم مسبقاً");
      }

      throw Exception(msg);
    }
  }
}
