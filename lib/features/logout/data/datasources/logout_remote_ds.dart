import 'package:dio/dio.dart';
import '../../../../app/di/injection_container.dart';
import '../../../../core/services/storage_service.dart';
import '../models/logout_model.dart';

abstract class LogoutRemoteDs {
  Future<LogoutModel> logout();
}

class LogoutRemoteDsImpl implements LogoutRemoteDs {
  final Dio dio;

  LogoutRemoteDsImpl(this.dio);

  @override
  Future<LogoutModel> logout() async {
    // final token = await StorageService().getToken();
final storage = getIt<StorageService>();

final token = await storage.getToken();
    final response = await dio.get(
      'logout',
      // options: Options(
      //   headers: {
      //     'Authorization': "Bearer 1|EqwdbI3diHdVXpg1Njap6hXmgTyDfov6CVEOYddd22ca1608",
      //   },
      // ),
    );
    print(LogoutModel.fromJson(response.data));

    return LogoutModel.fromJson(response.data);
  }
}