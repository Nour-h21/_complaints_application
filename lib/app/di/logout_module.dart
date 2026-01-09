import 'package:complaints_application/app/di/injection_container.dart';

import '../../features/logout/data/datasources/logout_remote_ds.dart';
import '../../features/logout/data/repositories/logout_repositry_impl.dart';
import '../../features/logout/domain/repositories/logout_repositry.dart';
import '../../features/logout/domain/usecase/logout_usecase.dart';
import '../../features/logout/presentation/bloc/logout_bloc.dart';

Future<void> initLogOutModule() async {
 getIt.registerLazySingleton<LogoutRemoteDs>(
  () => LogoutRemoteDsImpl(getIt()),
);

getIt.registerLazySingleton<LogoutRepository>(
  () => LogoutRepositoryImpl(getIt()),
);

getIt.registerLazySingleton(
  () => LogoutUseCase(getIt()),
);

getIt.registerFactory(
  () => LogoutBloc(getIt()),
);
}
