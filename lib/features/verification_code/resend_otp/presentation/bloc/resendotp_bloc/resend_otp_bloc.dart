import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/resend_otp_usecase.dart';

part 'resend_otp_event.dart';
part 'resend_otp_state.dart';

class ResendOtpBloc extends Bloc<ResendOtpEvent, ResendOtpState> {
  final ResendOtpUsecase useCase;
  Timer? _timer;

  ResendOtpBloc(this.useCase) : super(ResendOtpState.initial()) {
    on<StartTimerEvent>(_onStartTimer);
    on<TimerTickedEvent>(_onTimerTicked);
    on<ResendCodePressedEvent>(_onResendPressed);

    /// يبدأ العداد مباشرة عند الدخول
    add(StartTimerEvent());
  }

  void _onStartTimer(StartTimerEvent event, Emitter<ResendOtpState> emit) {
    _timer?.cancel();
    int duration = 60;

    emit(state.copyWith(
      isButtonEnabled: false,
      duration: duration,
      errorMessage: null,
      successMessage: null,
    ));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration--;
      if (duration >= 0) {
        add(TimerTickedEvent(duration));
      } else {
        timer.cancel();
      }
    });
  }

  void _onTimerTicked(
      TimerTickedEvent event, Emitter<ResendOtpState> emit) {
    if (event.duration == 0) {
      emit(state.copyWith(
        duration: 0,
        isButtonEnabled: true,
      ));
    } else {
      emit(state.copyWith(duration: event.duration));
    }
  }

  Future<void> _onResendPressed(
      ResendCodePressedEvent event, Emitter<ResendOtpState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await useCase();

    if (result.status == 1) {
      /// نجح الإرسال → نعيد العداد
      emit(state.copyWith(
        isLoading: false,
        successMessage: result.message,
      ));
      add(StartTimerEvent());
    } else {
      /// فشل → الزر يبقى مفتوح
      emit(state.copyWith(
        isLoading: false,
        errorMessage: result.message,
        isButtonEnabled: true,
      ));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}