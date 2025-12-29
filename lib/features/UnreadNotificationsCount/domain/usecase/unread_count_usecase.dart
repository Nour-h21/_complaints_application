import '../entities/unread_count_entity.dart';
import '../repositories/unread_count_repository.dart';

class GetUnreadCountUseCase {
  final UnreadCountRepository repository;

  GetUnreadCountUseCase(this.repository);

  Future<UnreadCountEntity> call() {
    return repository.getUnreadCount();
  }
}