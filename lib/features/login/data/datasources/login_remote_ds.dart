import 'package:dio/dio.dart';

import '../models/login_model.dart';

abstract class LoginRemoteDs {
  Future<LoginModel> login(Map<String, dynamic> body);
}

class LoginRemoteDsImpl implements LoginRemoteDs {
  final Dio dio;

  LoginRemoteDsImpl(this.dio,);

  @override
  Future<LoginModel> login(Map<String, dynamic> body) async {
    // if (!await networkChecker.isConnected) {
    //   throw Exception("لا يوجد اتصال بالإنترنت");
    // }

    final response = await dio.post("signin", data: body);
    return LoginModel.fromJson(response.data);
  }
}
