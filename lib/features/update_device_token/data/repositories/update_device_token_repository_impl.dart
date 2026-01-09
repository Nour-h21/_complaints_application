import '../../domain/entities/update_device_token_entity.dart';
import '../../domain/repositories/update_device_token_repository.dart';
import '../datasources/update_device_token_remote_ds.dart';

class UpdateDeviceTokenRepositoryImpl implements UpdateDeviceTokenRepository {
  final UpdateDeviceTokenRemoteDs remoteDs;

  UpdateDeviceTokenRepositoryImpl(this.remoteDs);

  @override
  Future<UpdateDeviceTokenEntity> updateDeviceToken({
    required String userId,
    required String fcmToken,
  }) {
    return remoteDs.updateDeviceToken(
      userId: userId,
      fcmToken: fcmToken,
    );
  }
}