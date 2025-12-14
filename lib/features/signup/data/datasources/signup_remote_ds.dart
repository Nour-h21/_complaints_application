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
    try{
    final response = await dio.post("register", data: body);
  // print( SignupModel.fromJson(response.data));
  //   await StorageService.saveUserId(response.data["id"]);
  //   final userId = await StorageService.getUserId();
  //   print("id = $userId");
    return SignupModel.fromJson(response.data);
    }
    catch(e){
       if (e is DioException) {
        print("🔥 DIO ERROR: ${e.response?.data}");
        print("🔥 STATUS CODE: ${e.response?.statusCode}");
        print("🔥 MESSAGE: ${e.message}");
      } else {
        print("🔥 OTHER ERROR: $e");
      }
      rethrow;
    
    }
    
  }
}
