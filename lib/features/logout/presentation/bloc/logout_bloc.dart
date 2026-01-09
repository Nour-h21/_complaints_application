import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/logout_usecase.dart';
import 'logout_event.dart';
import 'logout_state.dart';
import '../../../../core/services/storage_service.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUseCase useCase;

  LogoutBloc(this.useCase) : super(LogoutInitial()) {
    on<LogoutRequested>((event, emit) async {
      emit(LogoutLoading());
      try {
        final result = await useCase();
        await StorageService.clearToken(); // حذف التوكن
        emit(LogoutSuccess(result.message));
      } catch (e) {
        emit(LogoutError(e.toString()));
      }
    });
  }
}