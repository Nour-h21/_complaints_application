import '../../domain/entities/update_device_token_entity.dart';

class UpdateDeviceTokenModel extends UpdateDeviceTokenEntity {
  UpdateDeviceTokenModel({required super.message});

  factory UpdateDeviceTokenModel.fromJson(Map<String, dynamic> json) {
    return UpdateDeviceTokenModel(
      message: json['message'] ?? '',
    );
  }
}