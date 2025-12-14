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
      final msg = e.response?.data["message"] ?? "حدث خطأ غير متوقع";

      if (msg == "The email has already been taken.") {
        throw Exception("البريد الإلكتروني مستخدم مسبقًا");
      }

      if (msg == "The name field is required.") {
        throw Exception("الاسم مطلوب");
      }

      if (msg == "The password field confirmation does not match.") {
        throw Exception("تأكيد كلمة السر غير متطابق");
      }

      if (msg == "The email field must be a valid email address.") {
        throw Exception("البريد الإلكتروني غير صالح");
      }

      throw Exception(msg);
    }
  }
}
