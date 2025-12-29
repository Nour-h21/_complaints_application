import 'package:complaints_application/app/di/injection_container.dart';

import '../../features/notification/data/datasources/notifications_remote_ds.dart';
import '../../features/notification/data/repositories/notifications_repository_impl.dart';
import '../../features/notification/domain/repositories/notifications_repository.dart';
import '../../features/notification/domain/usecase/notifications_usecase.dart';
import '../../features/notification/presentation/bloc/bloc/notifications_bloc.dart';


Future<void> initNotoficationsModule() async {

 // Notification
getIt.registerLazySingleton<NotificationsRemoteDs>(
  () => NotificationsRemoteDsImpl(getIt()),
);

getIt.registerLazySingleton<NotificationsRepository>(
  () => NotificationsRepositoryImpl(getIt()),
);

getIt.registerLazySingleton(
  () => GetNotificationsUseCase(getIt()),
);

getIt.registerFactory(
  () => NotificationsBloc(getIt()),
);
}