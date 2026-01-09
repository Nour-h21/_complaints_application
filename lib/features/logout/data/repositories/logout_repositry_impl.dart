import '../../domain/entities/logout_entity.dart';
import '../../domain/repositories/logout_repositry.dart';
import '../datasources/logout_remote_ds.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  final LogoutRemoteDs remote;

  LogoutRepositoryImpl(this.remote);

  @override
  Future<LogoutEntity> logout() async {
    return await remote.logout();
  }
}