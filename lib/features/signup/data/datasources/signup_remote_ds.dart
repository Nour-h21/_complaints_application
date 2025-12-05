import 'package:dio/dio.dart';
import '../../../../core/services/storage_service.dart';
import '../models/signup_model.dart';

abstract class SignupRemoteDs {
  Future<SignupModel> signup(Map<String, dynamic> body);
}

class SignupRemoteDsImpl implements SignupRemoteDs {
  final Dio dio;

  SignupRemoteDsImpl(this.dio);

  @override
  Future<SignupModel> signup(Map<String, dynamic> body) async {
    final response = await dio.post("register", data: body);
    await StorageService.saveUserId(response.data["id"]);
    final userId = await StorageService.getUserId();
    print("id = $userId");
    return SignupModel.fromJson(response.data);
  }
}
