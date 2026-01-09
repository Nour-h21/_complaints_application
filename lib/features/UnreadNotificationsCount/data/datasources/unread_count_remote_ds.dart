import 'package:complaints_application/core/services/storage_service.dart';
import 'package:dio/dio.dart';
import '../../../../app/di/injection_container.dart';
import '../models/unread_count_model.dart';

abstract class UnreadCountRemoteDs {
  Future<UnreadCountModel> getUnreadCount();
}

class UnreadCountRemoteDsImpl implements UnreadCountRemoteDs {
  final Dio dio;

  UnreadCountRemoteDsImpl(this.dio);

  @override
  Future<UnreadCountModel> getUnreadCount() async {
    // final userId = await StorageService.getUserId();
    final storage = getIt<StorageService>();

    final userId = await storage.getUserId();
    final response = await dio.get('/get-unread-notifications-count/$userId');

    return UnreadCountModel.fromJson(response.data);
  }
}
