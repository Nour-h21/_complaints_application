import 'package:complaints_application/app/di/injection_container.dart';
import 'package:complaints_application/core/constants/urls/api_url.dart';
import 'package:dio/dio.dart';

import '../../core/services/storage_service.dart';

Future<void> initCoreModule() async {
 getIt.registerLazySingleton<Dio>((){
  final dio = Dio(
    BaseOptions(
      baseUrl: AppApi.baseUrl,
      // connectTimeout: AppApi.connectTimeout,
      // receiveTimeout: AppApi.receiveTimeout,
    ),
  );

dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) async {
      // Endpoints لا تحتاج توكن
      const authFreeEndpoints = [
        "signin",
        "register",
        "checkOtpCode",
        "resendOtp",
      ];

      // إذا الـ endpoint موجود ضمن القائمة → ما نضيف توكن
      if (authFreeEndpoints.any((e) => options.path.contains(e))) {
        return handler.next(options);
      }

      // غير هيك → نضيف التوكن
      final token = await getIt<StorageService>().getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer 1|EqwdbI3diHdVXpg1Njap6hXmgTyDfov6CVEOYddd22ca1608';
      }

      return handler.next(options);
    },
  ),


);
  return dio;
});

}








//   getIt.registerLazySingleton<Dio>((){
//   final dio = Dio(
//     BaseOptions(
//       baseUrl: AppApi.baseUrl,
//       // connectTimeout: AppApi.connectTimeout,
//       // receiveTimeout: AppApi.receiveTimeout,
//     ),
//   );

//   // إضافة Interceptor للـ Token
//   dio.interceptors.add(
//     InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         final token = await getIt<StorageService>().getToken();
//         if (token != null && token.isNotEmpty) {
//           options.headers['Authorization'] = 'Bearer $token';
//         }
//         return handler.next(options);
//       },
//     ),
//   );

//   return dio;
// });
