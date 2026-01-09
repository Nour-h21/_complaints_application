import '../../domain/entities/notifications_entity.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_remote_ds.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDs remoteDs;

  NotificationsRepositoryImpl(this.remoteDs);

  @override
  Future<List<NotificationEntity>> getNotifications() {
    return remoteDs.getNotifications();
  }
}