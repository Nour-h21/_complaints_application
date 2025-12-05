import '../entities/signup_entity.dart';

abstract class SignupRepository {
  Future<SignupEntity> signup({
    required String name,
    required String emailOrPhone,
    required String password,
    required String confirmPassword,
  });
}
