import 'package:complaints_application/features/add_complaint/presentation/bloc/add_complaint_bloc.dart';

import '../../core/services/storage_service.dart';
import '../../features/add_complaint/data/datasources/add_complaint_remote_ds.dart';
import '../../features/add_complaint/data/repositories/add_complaint_repositry_impl.dart';
import '../../features/add_complaint/domain/repositories/add_complaint_repositry.dart';
import '../../features/add_complaint/domain/usecase/add_complaint_usecase.dart';
import 'injection_container.dart';

Future<void> initAddcomplaintModule() async {
 ///Add
  // Data sources
  if (!getIt.isRegistered<AddComplaintRemoteDataSource>()) {
    getIt.registerLazySingleton<AddComplaintRemoteDataSource>(
      () => AddComplaintRemoteDataSourceImpl(getIt()),
    );
  }

  if (!getIt.isRegistered<AddComplaintRepository>()) {
    getIt.registerLazySingleton<AddComplaintRepository>(
      () => AddComplaintRepositoryImpl(getIt<AddComplaintRemoteDataSource>()),
    );
  }


  // Usecases
  if (!getIt.isRegistered<SubmitComplaintUseCase>()) {
    getIt.registerLazySingleton(() => SubmitComplaintUseCase(getIt()));
  }

  // Bloc
  if (!getIt.isRegistered<AddComplaintBloc>()) {
    getIt.registerFactory(() => AddComplaintBloc(submitUseCase: getIt()));
  }

    // StorageService
  getIt.registerLazySingleton<StorageService>(() => StorageService());

}
