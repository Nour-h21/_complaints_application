import 'package:complaints_application/app/di/injection_container.dart';

import '../../features/signup/data/datasources/signup_remote_ds.dart';
import '../../features/signup/data/repositories/signup_repository_impl.dart';
import '../../features/signup/domain/usecase/signup_usecase.dart';
import '../../features/signup/presentation/bloc/signup_bloc.dart';


Future<void> initSignupModule() async {
  // remote DS
  getIt.registerLazySingleton<SignupRemoteDs>(
      () => SignupRemoteDsImpl(getIt()));

  // repository
  getIt.registerLazySingleton(
      () => SignupRepositoryImpl(getIt<SignupRemoteDs>()));

  // usecase
  getIt.registerLazySingleton(
      () => SignupUsecase(getIt<SignupRepositoryImpl>()));

  // bloc
  getIt.registerFactory(
      () => SignupBloc(getIt<SignupUsecase>()));
}
