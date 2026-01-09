import 'package:dio/dio.dart';
import '../../../../../app/di/injection_container.dart';
import '../../../../../core/services/storage_service.dart';
import '../models/resend_otp_model.dart';

abstract class ResendOtpRemoteDs {
  Future<ResendOtpModel> resendOtp();
}

class ResendOtpRemoteDsImpl implements ResendOtpRemoteDs {
  final Dio dio;

  ResendOtpRemoteDsImpl(this.dio);

  @override
  Future<ResendOtpModel> resendOtp() async {
    // final userId = await StorageService.getUserId();
    final storage = getIt<StorageService>();

 final userId = await storage.getUserId();
    final response = await dio.get("resendOtp/$userId");

    return ResendOtpModel.fromJson(response.data);
  }
}

