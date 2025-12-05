import '../entities/verification_code_entity.dart';

abstract class VerifyOtpRepository {
  Future<VerifyOtpEntity> verifyOtp({
    required String otp
  });
}
