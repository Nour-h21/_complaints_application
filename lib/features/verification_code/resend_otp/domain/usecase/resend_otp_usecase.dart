import '../entities/resend_otp_entity.dart';
import '../repositories/resend_otp_repository.dart';

class ResendOtpUsecase {
  final ResendOtpRepository repository;

  ResendOtpUsecase(this.repository);

  Future<ResendOtpEntity> call() async {
    return await repository.resendOtp();
  }
}
