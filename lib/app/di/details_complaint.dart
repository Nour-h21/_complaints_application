import 'package:complaints_application/app/di/injection_container.dart';

import '../../features/details_complaint/data/datasources/details_complaint_remote_ds.dart';
import '../../features/details_complaint/data/repositories/details_complaint_repositry_impl.dart';
import '../../features/details_complaint/domain/repositories/details_complaint_repositry.dart';
import '../../features/details_complaint/domain/usecase/details_complaint_usecase.dart';
import '../../features/details_complaint/presentation/bloc/details_complaint_bloc.dart';

Future<void> initDetailsomplaintModule() async {

getIt.registerLazySingleton<DetailsRemoteDataSource>(() => DetailsRemoteDataSourceImpl(getIt()));

getIt.registerLazySingleton<ComplaintsDetailsRepository>(() => ComplaintsRepositoryImpl(getIt()));

getIt.registerLazySingleton<GetComplaintDetailsUseCase>(() => GetComplaintDetailsUseCase(getIt()));

getIt.registerFactory(() => DetailsBloc(getIt()));
}