import 'package:firebase_messaging/firebase_messaging.dart';

import '../../domain/usecase/update_device_token_usecase.dart';

class FcmTokenHandler {
  final UpdateDeviceTokenUseCase updateDeviceTokenUseCase;

  FcmTokenHandler(this.updateDeviceTokenUseCase);

  Future<void> init(String userId) async {
    final messaging = FirebaseMessaging.instance;

    await messaging.requestPermission();

    // 🔥 أول توكن
    final token = await messaging.getToken();
    if (token != null) {
      await updateDeviceTokenUseCase(
        userId: userId,
        fcmToken: token,
      );
    }

    // 🔁 أي تحديث مستقبلي
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      await updateDeviceTokenUseCase(
        userId: userId,
        fcmToken: newToken,
      );
    });
  }
}