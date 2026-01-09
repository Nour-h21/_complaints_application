import 'package:complaints_application/app/di/injection_container.dart';

import '../../features/UnreadNotificationsCount/data/datasources/unread_count_remote_ds.dart';
import '../../features/UnreadNotificationsCount/data/repositories/unread_count_repository_impl.dart';
import '../../features/UnreadNotificationsCount/domain/repositories/unread_count_repository.dart';
import '../../features/UnreadNotificationsCount/domain/usecase/unread_count_usecase.dart';
import '../../features/UnreadNotificationsCount/presentation/bloc/bloc/unread_count_bloc.dart';

Future<void> initUnreadCountModule() async {

 // Notification
getIt.registerLazySingleton<UnreadCountRemoteDs>(
  () => UnreadCountRemoteDsImpl(getIt()),
);

getIt.registerLazySingleton<UnreadCountRepository>(
  () => UnreadCountRepositoryImpl(getIt()),
);

getIt.registerLazySingleton(
  () => GetUnreadCountUseCase(getIt()),
);

getIt.registerFactory(
  () => UnreadCountBloc(getIt()),
);
}