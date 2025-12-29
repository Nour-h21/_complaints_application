import 'package:dio/dio.dart';
import '../../../../app/di/injection_container.dart';
import '../../../../core/services/storage_service.dart';
import '../../../update_device_token/presentation/pages/fcm_token_handler.dart';
import '../models/signup_model.dart';

abstract class SignupRemoteDs {
  Future<SignupModel> signup(Map<String, dynamic> body);
}

class SignupRemoteDsImpl implements SignupRemoteDs {
  final Dio dio;

  SignupRemoteDsImpl(this.dio);

  @override
  Future<SignupModel> signup(Map<String, dynamic> body) async {
    try{
    final response = await dio.post("register", data: body);
  print( SignupModel.fromJson(response.data));
    await StorageService.saveUserId(response.data["data"]["id"].toString());
    final userId = await StorageService.getUserId();
    print("id = $userId");

    getIt<FcmTokenHandler>().init(userId!);
    return SignupModel.fromJson(response.data);
    }
    catch(e , stackTrace){
       if (e is DioException) {
        print("🔥 DIO ERROR: ${e.response?.data}");
        print("🔥 STATUS CODE: ${e.response?.statusCode}");
        print("🔥 MESSAGE: ${e.message}");
      } else {
        print("🔥 OTHER ERROR: $e");
        print("🔥 StackTrace: $stackTrace");
      }
      rethrow;
    
    }
    
  }
}
