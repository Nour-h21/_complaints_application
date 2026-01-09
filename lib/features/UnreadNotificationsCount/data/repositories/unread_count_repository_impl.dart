import '../../domain/entities/unread_count_entity.dart';
import '../../domain/repositories/unread_count_repository.dart';
import '../datasources/unread_count_remote_ds.dart';

class UnreadCountRepositoryImpl implements UnreadCountRepository {
  final UnreadCountRemoteDs remoteDs;

  UnreadCountRepositoryImpl(this.remoteDs);

  @override
  Future<UnreadCountEntity> getUnreadCount() async {
    return await remoteDs.getUnreadCount();
  }
}