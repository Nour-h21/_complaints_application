import 'package:bloc/bloc.dart';
import '../../../domain/usecase/notifications_usecase.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';


class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetNotificationsUseCase getNotificationsUseCase;

  NotificationsBloc(this.getNotificationsUseCase)
      : super(NotificationsInitial()) {
    on<FetchNotificationsEvent>((event, emit) async {
      emit(NotificationsLoading());
      try {
        final notifications =
            await getNotificationsUseCase();
        emit(NotificationsLoaded(notifications));
      } catch (e) {
        emit(NotificationsError(e.toString()));
      }
    });
  }
}
