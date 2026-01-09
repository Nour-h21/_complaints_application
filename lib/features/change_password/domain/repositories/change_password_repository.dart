import 'package:complaints_application/features/change_password/domain/entities/reset_password_entity.dart';

import '../entities/check_code_entity.dart';
import '../entities/forgot_password_entity.dart';

abstract class ChangePasswordRepository {
  Future<ForgotPasswordEntity> forgotPassword({
    required String email,
    
  });

  Future<CheckCodeEntity> checkCode({
    required String code,
    
  });

  Future<ResetPasswordEntity> resetPassword({
    required String code,
    required String password,
    required String confirmPassword,
    
  });
}
