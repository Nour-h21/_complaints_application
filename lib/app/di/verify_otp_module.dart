import '../../features/verification_code/verify_otp/data/datasources/verification_code_remote_ds.dart';
import '../../features/verification_code/verify_otp/data/repositories/verification_code_repository_impl.dart';
import '../../features/verification_code/verify_otp/domain/usecase/verification_code_usecase.dart';
import '../../features/verification_code/verify_otp/presentation/bloc/verifyotp_bloc/otp_bloc.dart';
import 'injection_container.dart';

Future<void> initVerifyOtpModule() async {

  getIt.registerLazySingleton<VerifyOtpRemoteDs>(
    () => VerifyOtpRemoteDsImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton(
    () => VerifyOtpRepositoryImpl(getIt<VerifyOtpRemoteDs>()),
  );

  // UseCase
  getIt.registerLazySingleton(
    () => VerifyOtpUsecase(getIt<VerifyOtpRepositoryImpl>()),
  );

  // Bloc
  getIt.registerFactory(
    () => OtpBloc(getIt<VerifyOtpUsecase>()),
  );
}

// import 'package:get_it/get_it.dart';
// import 'package:dio/dio.dart';



// final getIt = GetIt.instance;

// Future<void> initOtpModule() async {
//   // DataSource
//   getIt.registerLazySingleton<VerifyOtpRemoteDs>(
//     () => VerifyOtpRemoteDsImpl(getIt<Dio>()),
//   );

//   // Repository
//   getIt.registerLazySingleton<VerifyOtpRepository>(
//     () => VerifyOtpRepositoryImpl(getIt<VerifyOtpRemoteDs>()),
//   );

//   // UseCase
//   getIt.registerLazySingleton(
//     () => VerifyOtpUsecase(getIt<VerifyOtpRepository>()),
//   );

//   // Bloc
//   getIt.registerFactory(
//     () => OtpBloc(getIt<VerifyOtpUsecase>()),
//   );
// }
