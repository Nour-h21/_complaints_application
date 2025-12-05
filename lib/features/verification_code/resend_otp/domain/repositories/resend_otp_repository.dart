import '../entities/resend_otp_entity.dart';

abstract class ResendOtpRepository {
  Future<ResendOtpEntity> resendOtp();
}
