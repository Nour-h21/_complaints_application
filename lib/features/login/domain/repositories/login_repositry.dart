import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> login({
    required String emailOrPhone,
    required String password,
  });
}
