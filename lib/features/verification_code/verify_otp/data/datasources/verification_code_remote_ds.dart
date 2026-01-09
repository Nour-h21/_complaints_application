import 'package:complaints_application/core/services/storage_service.dart';
import 'package:dio/dio.dart';

import '../../../../../app/di/injection_container.dart';
import '../models/verification_code_model.dart';

abstract class VerifyOtpRemoteDs {
  Future<VerifyOtpModel> verifyOtp({required String otp});
}

class VerifyOtpRemoteDsImpl implements VerifyOtpRemoteDs {
  final Dio dio;

  VerifyOtpRemoteDsImpl(this.dio);

  @override
  Future<VerifyOtpModel> verifyOtp({required String otp}) async {
    // final userId = await StorageService.getUserId();
    // final token = await StorageService.saveToken(token);
    final storage = getIt<StorageService>();

    final userId = await storage.getUserId();
    final response = await dio.post(
      'checkOtpCode/$userId',
      data: {'otp_code': otp},
    );
    final verifiResponse = VerifyOtpModel.fromJson(response.data);
    // await StorageService.saveToken(verifiResponse.data);

    await storage.saveToken(verifiResponse.data);
    if (response.statusCode == 200) {
      return VerifyOtpModel.fromJson(response.data);
    } else {
      throw Exception("response.data['message'] ?? 'حدث خطأ غير معروف'");
    }
  }
}
