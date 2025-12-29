import '../entities/update_device_token_entity.dart';
import '../repositories/update_device_token_repository.dart';

class UpdateDeviceTokenUseCase {
  final UpdateDeviceTokenRepository repository;

  UpdateDeviceTokenUseCase(this.repository);

  Future<UpdateDeviceTokenEntity> call({
    required String userId,
    required String fcmToken,
  }) {
    return repository.updateDeviceToken(
      userId: userId,
      fcmToken: fcmToken,
    );
  }
}