import '../entities/logout_entity.dart';
import '../repositories/logout_repositry.dart';

class LogoutUseCase {
  final LogoutRepository repository;

  LogoutUseCase(this.repository);

  Future<LogoutEntity> call() async {
    return await repository.logout();
  }
}