import '../entities/update_device_token_entity.dart';

import '../entities/update_device_token_entity.dart';

abstract class UpdateDeviceTokenRepository {
  Future<UpdateDeviceTokenEntity> updateDeviceToken({
    required String userId,
    required String fcmToken,
  });
}