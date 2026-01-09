import 'package:dio/dio.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/services/storage_service.dart';
import '../../../update_device_token/presentation/pages/fcm_token_handler.dart';
import '../models/login_model.dart';

abstract class LoginRemoteDs {
  Future<LoginModel> login(Map<String, dynamic> body);
}

class LoginRemoteDsImpl implements LoginRemoteDs {
  final Dio dio;

  LoginRemoteDsImpl(this.dio);

  @override
  Future<LoginModel> login(Map<String, dynamic> body) async {
    // if (!await networkChecker.isConnected) {
    //   throw Exception("لا يوجد اتصال بالإنترنت");
    // }

    final response = await dio.post("signin", data: body);
    final loginResponse = LoginModel.fromJson(response.data);
    final storage = getIt<StorageService>();

    await storage.saveToken(loginResponse.token);
    await storage.saveUserId(loginResponse.id.toString());

    // await StorageService.saveToken(loginResponse.token);
    // await StorageService.saveUserId(loginResponse.id.toString());
    getIt<FcmTokenHandler>().init(loginResponse.id.toString());
    return LoginModel.fromJson(response.data);
  }
}
