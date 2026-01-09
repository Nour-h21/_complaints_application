import '../entities/check_code_entity.dart';
import '../repositories/change_password_repository.dart';

class CheckCodeUsecase {
  final ChangePasswordRepository repository;

  CheckCodeUsecase(this.repository);

  Future<CheckCodeEntity> call({
    required String code,
  }) async {
    return await repository.checkCode(
      code: code,
    );
  
  }
}
