import 'package:complaints_application/core/services/storage_service.dart';
import 'package:dio/dio.dart';

import '../models/notifications_model.dart';

abstract class NotificationsRemoteDs {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationsRemoteDsImpl implements NotificationsRemoteDs {
  final Dio dio;

  NotificationsRemoteDsImpl(this.dio);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final userId = await StorageService.getUserId();
    final response = await dio.get('get-notifications/$userId');

    final List list = response.data['data'];

    return list
        .map((e) => NotificationModel.fromJson(e))
        .toList();
  }
}