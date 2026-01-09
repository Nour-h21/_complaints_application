import 'package:dio/dio.dart';

import '../../domain/entities/check_code_entity.dart';
import '../../domain/entities/forgot_password_entity.dart';
import '../../domain/entities/reset_password_entity.dart';
import '../models/check_code_model.dart';
import '../models/forgot_password_model.dart';
import '../models/reset_password_model.dart';

abstract class ChangePasswordRemoteDs {
  Future<ForgotPasswordEntity> forgotPassword(Map<String, dynamic> body);
  Future<CheckCodeEntity> checkCode(Map<String, dynamic> body);
  Future<ResetPasswordEntity> resetPassword(code ,Map<String, dynamic> body);
}

class ChangePasswordRemoteDsImpl implements ChangePasswordRemoteDs {
  final Dio dio;

  ChangePasswordRemoteDsImpl(this.dio);

  @override
  Future<ForgotPasswordModel> forgotPassword(Map<String, dynamic> body) async {
    final response = await dio.post("userForgotPassword", data: body);
    print('ccccccc${ForgotPasswordModel.fromJson(response.data)}');
    return ForgotPasswordModel.fromJson(response.data);
  }
  
  @override
  Future<CheckCodeModel> checkCode(Map<String, dynamic> body) async {
    final response = await dio.post("userCheckCode", data: body);
    final res = CheckCodeModel.fromJson(response.data);
    print('nnnnnnnnnnnnn${res}');
    // final code = res.code;
    return res;
  }
  
  @override
  Future<ResetPasswordModel> resetPassword(code ,Map<String, dynamic> body) async {
    final response = await dio.post("userResetPassword/$code", data: body);

    return ResetPasswordModel.fromJson(response.data);
  }
}
