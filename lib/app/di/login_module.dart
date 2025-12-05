import '../../features/login/data/datasources/login_remote_ds.dart';
import '../../features/login/data/repositories/login_repositry_impl.dart';
import '../../features/login/domain/usecase/login_usecase.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import 'injection_container.dart';

Future<void> initLoginModule() async {

  // Datasources
  getIt.registerLazySingleton<LoginRemoteDs>(
      () => LoginRemoteDsImpl(getIt()));

  // getIt.registerLazySingleton<LoginRemoteDs>(
  //   () => LoginRemoteDataSourceImpl(getIt<Dio>(), sl<NetworkChecker>()));

  // Repository
  getIt.registerLazySingleton(
      () => LoginRepositoryImpl(getIt<LoginRemoteDs>()));

  // Usecase
  getIt.registerLazySingleton(
      () => LoginUsecase(getIt<LoginRepositoryImpl>()));

  // Bloc
  getIt.registerFactory(
      () => LoginBloc(getIt<LoginUsecase>()));
}
