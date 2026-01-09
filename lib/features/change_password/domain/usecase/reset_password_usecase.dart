import 'package:complaints_application/features/change_password/domain/entities/reset_password_entity.dart';

import '../repositories/change_password_repository.dart';

class ResetPasswordUsecase {
  final ChangePasswordRepository repository;

  ResetPasswordUsecase(this.repository);

  Future<ResetPasswordEntity> call({
    required String code,
    required String password,
    required String confirmPassword,
  }) async {
    return await repository.resetPassword(
      code: code,
      password: password,
      confirmPassword: confirmPassword,
    );
  
  }
}