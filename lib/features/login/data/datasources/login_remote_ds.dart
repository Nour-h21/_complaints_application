// import 'package:dio/dio.dart';
// import '../../../../core/services/network_checker.dart';
// import '../models/user_model.dart';

abstract class LoginRemoteDataSource {
//   Future<UserModel> login(String email, String password);
// }

// class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
//   final Dio dio;
//   final NetworkChecker networkChecker;

//   LoginRemoteDataSourceImpl(this.dio, this.networkChecker);

//   @override
//   Future<UserModel> login(String email, String password) async {
//     if (!await networkChecker.isConnected) {
//       throw Exception("لا يوجد اتصال بالإنترنت");
//     }

//     final response = await dio.post("login", data: {
//       "email": email,
//       "password": password,
//     });

//     return UserModel.fromJson(response.data);
//   }
// }
}