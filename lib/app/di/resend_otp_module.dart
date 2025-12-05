import '../../features/verification_code/resend_otp/data/datasources/resend_otp_remote_ds.dart';
import '../../features/verification_code/resend_otp/data/repositories/resend_otp_repository_impl.dart';
import '../../features/verification_code/resend_otp/domain/usecase/resend_otp_usecase.dart';
import '../../features/verification_code/resend_otp/presentation/bloc/resendotp_bloc/resend_otp_bloc.dart';
import 'injection_container.dart';

Future<void> initResendOtpModule() async {

 getIt.registerLazySingleton<ResendOtpRemoteDs>(
    () => ResendOtpRemoteDsImpl(getIt()));

  // 3) Repository
  getIt.registerLazySingleton(
    () => ResendOtpRepositoryImpl(getIt<ResendOtpRemoteDs>()),
  );

  // 4) UseCase
  getIt.registerLazySingleton(
    () => ResendOtpUsecase(getIt<ResendOtpRepositoryImpl>()),
  );

  // 5) Bloc
  getIt.registerFactory(
    () => ResendOtpBloc( getIt<ResendOtpUsecase>()),
  );
}
