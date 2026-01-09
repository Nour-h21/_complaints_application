import '../entities/notifications_entity.dart';
import '../repositories/notifications_repository.dart';

class GetNotificationsUseCase {
  final NotificationsRepository repository;

  GetNotificationsUseCase(this.repository);

  Future<List<NotificationEntity>> call() {
    return repository.getNotifications();
  }
}