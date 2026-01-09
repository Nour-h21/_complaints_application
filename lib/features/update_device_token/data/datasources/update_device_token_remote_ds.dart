import 'package:dio/dio.dart';

import '../models/update_device_token.model.dart';

abstract class UpdateDeviceTokenRemoteDs {
  Future<UpdateDeviceTokenModel> updateDeviceToken({
    required String userId,
    required String fcmToken,
  });
}

class UpdateDeviceTokenRemoteDsImpl implements UpdateDeviceTokenRemoteDs {
  final Dio dio;

  UpdateDeviceTokenRemoteDsImpl(this.dio);

  @override
  Future<UpdateDeviceTokenModel> updateDeviceToken({
    required String userId,
    required String fcmToken,
  }) async {
    final response = await dio.put(
      'update-device-token',
      data: {
        'user_id': userId,
        'fcm_token': fcmToken,
      },
    );

    return UpdateDeviceTokenModel.fromJson(response.data);
  }
}