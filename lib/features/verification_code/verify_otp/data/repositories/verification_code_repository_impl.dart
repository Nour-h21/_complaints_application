import 'package:dio/dio.dart';

import '../../domain/entities/verification_code_entity.dart';
import '../../domain/repositories/verification_code_repository.dart';
import '../datasources/verification_code_remote_ds.dart';

class VerifyOtpRepositoryImpl implements VerifyOtpRepository {
  final VerifyOtpRemoteDs remote;

  VerifyOtpRepositoryImpl(this.remote);

  @override
  Future<VerifyOtpEntity> verifyOtp({
    required String otp
    }) async {
      try {

        return await remote.verifyOtp(otp : otp);
    } on DioException catch (e) {
      final msg = e.response?.data["message"] ?? "حدث خطأ غير متوقع";

      if (msg == "رمز التحقق غير صحيح") {
        throw Exception("رمز التحقق غير صحيح");
      }

      if (msg == "انتهت صلاحية الرمز") {
        throw Exception("انتهت صلاحية الرمز");
      }

      if (msg == "The selected code is invalid.") {
        throw Exception("الرمز المدخل غير صالح");
      }

      throw Exception(msg);
    }

  //   return remoteDataSource.verifyOtp(userId: userId, otp: otp);
  }
}
