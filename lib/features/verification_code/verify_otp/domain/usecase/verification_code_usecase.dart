import '../entities/verification_code_entity.dart';
import '../repositories/verification_code_repository.dart';

class VerifyOtpUsecase {
  final VerifyOtpRepository repository;
  VerifyOtpUsecase(this.repository);

  Future<VerifyOtpEntity> call({
    required String otp
    }) async {
    return await repository.verifyOtp(
      otp: otp
    );
  }
}

