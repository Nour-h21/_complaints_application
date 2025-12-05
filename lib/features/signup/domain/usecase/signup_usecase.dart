import '../repositories/signup_repository.dart';
import '../entities/signup_entity.dart';

class SignupUsecase {
  final SignupRepository repository;

  SignupUsecase(this.repository);

  Future<SignupEntity> call({
    required String name,
    required String emailOrPhone,
    required String password,
    required String confirmPassword,
  }) async {
    return await repository.signup(
      name: name,
      emailOrPhone: emailOrPhone,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
