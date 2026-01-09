import 'package:dio/dio.dart';

import '../../domain/entities/verification_code_entity.dart';
import '../../domain/repositories/verification_code_repository.dart';
import '../datasources/verification_code_remote_ds.dart';

class VerifyOtpRepositoryImpl implements VerifyOtpRepository {
  final VerifyOtpRemoteDs remote;

  VerifyOtpRepositoryImpl(this.remote);

  @override
  Future<VerifyOtpEntity> verifyOtp({required String otp}) async {
    try {
      return await remote.verifyOtp(otp: otp);
    } on DioException catch (e) {
      final responseData = e.response?.data;

      if (responseData != null && responseData["errors"] != null) {
        final errors = responseData["errors"];

        // نتأكد إنو errors عبارة عن Map
        if (errors is Map<String, dynamic>) {
          // نتحقق من otp_code
          if (errors.containsKey("otp_code")) {
            final otpErrors = errors["otp_code"];

            if (otpErrors is List && otpErrors.isNotEmpty) {
              final errorMessage = otpErrors.first.toString();

              // ترجمة الرسائل
              if (errorMessage == "The selected otp code is invalid.") {
                throw Exception("الرمز المدخل غير صالح");
              }
              if (errorMessage == "رمز التحقق غير صحيح") {
                throw Exception("رمز التحقق غير صحيح");
              }

              if (errorMessage == "انتهت صلاحية الرمز") {
                throw Exception("انتهت صلاحية الرمز");
              }

              // fallback في حال رسالة مختلفة
              throw Exception(errorMessage);
            }
          }
        }
      }

      // في حال ما كان في errors
      final msg = responseData?["message"] ?? "حدث خطأ غير متوقع";
      throw Exception(msg);
    }
  }
}
