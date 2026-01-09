import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/unread_count_usecase.dart';
import 'unread_count_event.dart';
import 'unread_count_state.dart';

class UnreadCountBloc
    extends Bloc<UnreadCountEvent, UnreadCountState> {
  final GetUnreadCountUseCase useCase;
  Timer? _timer;

  UnreadCountBloc(this.useCase) : super(UnreadCountInitial()) {
    on<FetchUnreadCountEvent>(_onFetchUnreadCount);
    on<StartUnreadCountPolling>(_onStartPolling);
    on<StopUnreadCountPolling>(_onStopPolling);
  }

  Future<void> _onFetchUnreadCount(
    FetchUnreadCountEvent event,
    Emitter<UnreadCountState> emit,
  ) async {
    try {
      final result = await useCase();
      emit(UnreadCountLoaded(result.count));
    } catch (e) {
      emit(UnreadCountError(e.toString()));
    }
  }

  void _onStartPolling(
    StartUnreadCountPolling event,
    Emitter<UnreadCountState> emit,
  ) {
    // أول جلب مباشرة
    add(FetchUnreadCountEvent());

    // تحديث كل 5 ثواني
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => add(FetchUnreadCountEvent()),
    );
  }

  void _onStopPolling(
    StopUnreadCountPolling event,
    Emitter<UnreadCountState> emit,
  ) {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}