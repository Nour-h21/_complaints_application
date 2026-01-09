import 'package:complaints_application/features/change_password/domain/entities/check_code_entity.dart';
import 'package:complaints_application/features/change_password/domain/entities/reset_password_entity.dart';

import '../../domain/entities/forgot_password_entity.dart';
import '../../domain/repositories/change_password_repository.dart';
import '../datasources/change_password_remote_ds.dart';
import 'package:dio/dio.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  final ChangePasswordRemoteDs remote;

  ChangePasswordRepositoryImpl(this.remote);

  @override
  Future<ForgotPasswordEntity> forgotPassword({required String email}) async {
    try {
      final body = {"email": email};

      print('$body');
      return await remote.forgotPassword(body);
    } on DioException catch (e) {
final responseData = e.response?.data;

      if (responseData != null && responseData["errors"] != null) {
        final errors = responseData["errors"];


        if (errors is Map<String, dynamic>) {
   
          if (errors.containsKey("email")) {
            final otpErrors = errors["email"];

            if (otpErrors is List && otpErrors.isNotEmpty) {
              final errorMessage = otpErrors.first.toString();

       
               if (errorMessage == "The selected email is invalid.") {
        throw Exception("البريد الإلكتروني غير مسجل مسبقًا");
      }
       
              throw Exception(errorMessage);
            }
          }
        }
      }

      // في حال ما كان في errors
      final msg = responseData?["message"] ?? "حدث خطأ غير متوقع";
      throw Exception(msg);
    }
  }
      
      // final msg = e.response?.data["message"] ?? "حدث خطأ غير متوقع";

      // if (msg == "The selected email is invalid.") {
      //   throw Exception("البريد الإلكتروني غير مسجل مسبقًا");
      // }
      // throw Exception(msg);
  //   }
  // }

  @override
  Future<CheckCodeEntity> checkCode({required String code}) async {
    try {
      final body = {"code": code};

      print('$body');
      return await remote.checkCode(body);
    } on DioException catch (e) {

      final responseData = e.response?.data;

      if (responseData != null && responseData["errors"] != null) {
        final errors = responseData["errors"];


        if (errors is Map<String, dynamic>) {
   
          if (errors.containsKey("code")) {
            final otpErrors = errors["code"];

            if (otpErrors is List && otpErrors.isNotEmpty) {
              final errorMessage = otpErrors.first.toString();

       
               if (errorMessage == "The selected code is invalid.") {
        throw Exception(" الرمز المدخل غير صالح");
      }
       
              throw Exception(errorMessage);
            }
          }
        }
      }

      // في حال ما كان في errors
      final msg = responseData?["message"] ?? "حدث خطأ غير متوقع";
      throw Exception(msg);
    }
  }
  //     final msg = e.response?.data["message"] ?? "حدث خطأ غير متوقع";

  //     if (msg == "The selected code is invalid.") {
  //       throw Exception(" الرمز المدخل غير صالح");
  //     }
  //     throw Exception(msg);
  //   }
  // }

   @override
  Future<ResetPasswordEntity> resetPassword({required String code, required String password,required String confirmPassword}) async {
    try {
      final body = {"password": password , "password_confirmation": confirmPassword};

      print('$body');
      return await remote.resetPassword(code, body);
    } on DioException catch (e) {


      final responseData = e.response?.data;

      if (responseData != null && responseData["errors"] != null) {
        final errors = responseData["errors"];


        if (errors is Map<String, dynamic>) {
   
          if (errors.containsKey("code")) {
            final otpErrors = errors["code"];

            if (otpErrors is List && otpErrors.isNotEmpty) {
              final errorMessage = otpErrors.first.toString();

       
               if (errorMessage == "The selected code is invalid.") {
        throw Exception(" الرمز المدخل غير صالح");
      }
       
              throw Exception(errorMessage);
            }
          }
        }
      }

      // في حال ما كان في errors
      final msg = responseData?["message"] ?? "حدث خطأ غير متوقع";
      throw Exception(msg);
    }
  }
  
      // final msg = e.response?.data["message"] ?? "حدث خطأ غير متوقع";

  //     if (msg == "The selected code is invalid.") {
  //       throw Exception(" الرمز المدخل غير صالح");
  //     }
  //     throw Exception(msg);
  //   }
  // }
}
