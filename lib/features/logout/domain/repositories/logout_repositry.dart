import '../entities/logout_entity.dart';

abstract class LogoutRepository {
  Future<LogoutEntity> logout();
}