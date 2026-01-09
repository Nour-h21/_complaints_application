import '../entities/unread_count_entity.dart';

abstract class UnreadCountRepository {
  Future<UnreadCountEntity> getUnreadCount();
}