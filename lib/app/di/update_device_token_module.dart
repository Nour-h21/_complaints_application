import 'package:complaints_application/app/di/injection_container.dart';
import 'package:complaints_application/features/update_device_token/data/datasources/update_device_token_remote_ds.dart';

import '../../features/update_device_token/data/repositories/update_device_token_repository_impl.dart';
import '../../features/update_device_token/domain/repositories/update_device_token_repository.dart';
import '../../features/update_device_token/domain/usecase/update_device_token_usecase.dart';
import '../../features/update_device_token/presentation/pages/fcm_token_handler.dart';

Future<void> initUpdateDeviceTokenModule() async {

 // Notification
getIt.registerLazySingleton<UpdateDeviceTokenRemoteDs>(
  () => UpdateDeviceTokenRemoteDsImpl(getIt()),
);

getIt.registerLazySingleton<UpdateDeviceTokenRepository>(
  () => UpdateDeviceTokenRepositoryImpl(getIt()),
);

getIt.registerLazySingleton(
  () => UpdateDeviceTokenUseCase(getIt()),
);

getIt.registerLazySingleton(
  () => FcmTokenHandler(getIt()),
);
}