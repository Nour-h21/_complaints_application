import '../entities/login_entity.dart';
import '../repositories/login_repositry.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase(this.repository);

  Future<LoginEntity> call({
    required String emailOrPhone,
    required String password,
    }) async {
    return await repository.login(
      emailOrPhone: emailOrPhone,
      password: password,
    );
  }
}
