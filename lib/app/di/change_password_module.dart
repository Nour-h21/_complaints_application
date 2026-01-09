import 'package:complaints_application/features/change_password/data/datasources/change_password_remote_ds.dart';
import 'package:complaints_application/features/change_password/domain/repositories/change_password_repository.dart';
import 'package:complaints_application/features/change_password/domain/usecase/check_code_usecase.dart';
import 'package:complaints_application/features/change_password/domain/usecase/reset_password_usecase.dart';

import '../../features/change_password/data/repositories/change_password_repository_impl.dart';
import '../../features/change_password/domain/usecase/forgot_password_usecase.dart';
import '../../features/change_password/presentation/bloc/change_password_bloc.dart';
import 'injection_container.dart';

Future<void> initChangePasswordModule() async {

   // data sources
  getIt.registerLazySingleton<ChangePasswordRemoteDs>(() => ChangePasswordRemoteDsImpl(getIt()));

  // repositories
  getIt.registerLazySingleton<ChangePasswordRepository>(() => ChangePasswordRepositoryImpl(getIt()));

  // usecases
  getIt.registerLazySingleton<ForgotPasswordUsecase>(() => ForgotPasswordUsecase(getIt()));
  getIt.registerLazySingleton<CheckCodeUsecase>(() => CheckCodeUsecase(getIt()));
  getIt.registerLazySingleton<ResetPasswordUsecase>(() => ResetPasswordUsecase(getIt()));

  // blocs
  getIt.registerFactory(() => ChangePasswordBloc(getIt<ForgotPasswordUsecase>(),getIt<CheckCodeUsecase>(), getIt<ResetPasswordUsecase>(),));

  

}