
import '../../features/edit_complaint/data/datasources/edit_complaint_remote_ds.dart';
import '../../features/edit_complaint/data/repositories/edit_complaint_repositry_impl.dart';
import '../../features/edit_complaint/domain/repositories/edit_complaint_repositry.dart';
import '../../features/edit_complaint/domain/usecase/edit_complaint_usecase.dart';
import '../../features/edit_complaint/presentation/bloc/edit_complaint_bloc.dart';
import 'injection_container.dart';

Future<void> initEditcomplaintModule() async {
  
//  // Data sources
//   if (!getIt.isRegistered<ComplaintRemoteDataSource>()) {
//     getIt.registerLazySingleton<ComplaintRemoteDataSource>(
//       () => ComplaintRemoteDataSourceImpl(getIt()),
//     );
//   }
 
// if (!getIt.isRegistered<ComplaintRepository>()) {
//     getIt.registerLazySingleton<ComplaintRepository>(
//       () => ComplaintRepositoryImpl(getIt<ComplaintRemoteDataSource>()),
//     );
//   }
 
//   // Usecases
//   if (!getIt.isRegistered<RespondToAdditionalInfo>()) {
//     getIt.registerLazySingleton(() => RespondToAdditionalInfo(getIt()));
//   }


//  // Bloc
//   if (!getIt.isRegistered<RespondAdditionalBloc>()) {
//     getIt.registerFactory(() => RespondAdditionalBloc(useCase: getIt()));
//   }
  


 /// Data
  getIt.registerLazySingleton<ComplaintRemoteDataSource>(
    () => ComplaintRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<ComplaintRepository>(
    () => ComplaintRepositoryImpl(getIt()),
  );

  /// Domain
  getIt.registerLazySingleton(() => EditComplaintUseCase(getIt()));

  /// Presentation
  getIt.registerFactory(() => EditComplaintBloc(getIt()));
  
  // Usecases
  if (!getIt.isRegistered<EditComplaintUseCase>()) {
    getIt.registerLazySingleton(() => EditComplaintUseCase(getIt()));
  }
}
