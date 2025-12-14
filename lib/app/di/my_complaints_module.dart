import 'package:complaints_application/app/di/injection_container.dart';

import '../../features/my_complaints/data/datasources/my_complaints_remote_ds.dart';
import '../../features/my_complaints/data/repositories/my_complaints_repositry_impl.dart';
import '../../features/my_complaints/domain/repositories/my_complaints_repositry.dart';
import '../../features/my_complaints/domain/usecase/my_complaints_usecase.dart';
import '../../features/my_complaints/presentation/bloc/my_complaint_bloc.dart';

Future<void> initMyComplaintsModule() async {

   // data sources
  getIt.registerLazySingleton<ComplaintsRemoteDataSource>(() => ComplaintsRemoteDataSourceImpl(getIt()));

  // repositories
  getIt.registerLazySingleton<ComplaintsRepository>(() => ComplaintsRepositoryImpl(getIt()));

  // usecases
  getIt.registerLazySingleton<GetMyComplaintsUseCase>(() => GetMyComplaintsUseCase(getIt()));

  // blocs
  getIt.registerFactory(() => ComplaintsBloc(getIt()));

  

}