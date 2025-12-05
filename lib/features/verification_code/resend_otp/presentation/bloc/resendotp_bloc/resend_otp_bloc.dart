// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'resend_otp_event.dart';
// part 'resend_otp_state.dart';

// class ResendOtpBloc extends Bloc<ResendOtpEvent, ResendOtpState> {
//   Timer? _timer;

//   ResendOtpBloc()
//       : super(ResendOtpState(canResend: false, secondsRemaining: 60)) {
//     on<StartTimerEvent>(_startTimer);
//     on<TickEvent>(_tick);
//     on<ResendPressedEvent>(_resendPressed);
//     on<ExpiredOtpEvent>(_expiredOtp);

//     /// أول ما يشتغل البلوك يبدأ العداد مباشرة
//     add(StartTimerEvent());
//   }

//   /// 🔵 بدء العداد من 60 ثانية
//   void _startTimer(StartTimerEvent event, Emitter<ResendOtpState> emit) {
//     emit(state.copyWith(canResend: false, secondsRemaining: 60));

//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       add(TickEvent());
//     });
//   }

//   /// 🔵 كل ثانية ينقص العداد
//   void _tick(TickEvent event, Emitter<ResendOtpState> emit) {
//     if (state.secondsRemaining > 0) {
//       emit(state.copyWith(secondsRemaining: state.secondsRemaining - 1));
//     } else {
//       emit(state.copyWith(canResend: true));
//       _timer?.cancel();
//     }
//   }

//   /// 🔵 عند الضغط على "إعادة إرسال الرمز"
//   void _resendPressed(
//       ResendPressedEvent event, Emitter<ResendOtpState> emit) {
//     if (state.canResend) {
//       _startTimer(StartTimerEvent(), emit);
//     }
//   }

//   /// ⭐ تفعيل إمكانية الإرسال فورًا عند انتهاء صلاحية الكود
//   void _expiredOtp(ExpiredOtpEvent event, Emitter<ResendOtpState> emit) {
//     _timer?.cancel();
//     emit(state.copyWith(
//       canResend: true,
//       secondsRemaining: 0,
//     ));
//   }

//   @override
//   Future<void> close() {
//     _timer?.cancel();
//     return super.close();
//   }
// }

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/resend_otp_usecase.dart';

part 'resend_otp_event.dart';
part 'resend_otp_state.dart';

class ResendOtpBloc extends Bloc<ResendOtpEvent, ResendOtpState> {
  final ResendOtpUsecase useCase;
  Timer? _timer;

  ResendOtpBloc(this.useCase)
      : super(ResendOtpState(
          canResend: false,
          secondsRemaining: 10,
          status: ResendOtpStatus.initial,
          message: '',
        )) {
    on<StartTimerEvent>(_startTimer);
    on<TickEvent>(_tick);
    on<ResendPressedEvent>(_resendPressed);

    add(StartTimerEvent()); // يبدأ العداد مباشرة عند إنشاء Bloc
  }

  void _startTimer(StartTimerEvent event, Emitter<ResendOtpState> emit) {
    
    emit(state.copyWith(canResend: false, secondsRemaining: 10));

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(TickEvent());
    });
  }

  void _tick(TickEvent event, Emitter<ResendOtpState> emit) {
    if (state.secondsRemaining > 0) {
      emit(state.copyWith(secondsRemaining: state.secondsRemaining - 1));
    } else {
      emit(state.copyWith(canResend: true,));
      _timer?.cancel();
    }
  }

 Future<void> _resendPressed(
    ResendPressedEvent event, Emitter<ResendOtpState> emit) async {
  if (!state.canResend) return;

  // فور الضغط: قفل الزر وبدء العداد
  add(StartTimerEvent());
  emit(state.copyWith(canResend: false, status: ResendOtpStatus.loading));

  try {
    final response = await useCase();

    if (!response.status) {
      // الرسالة مع حالة الخطأ من Repository
      emit(state.copyWith(
        status: ResendOtpStatus.error,
        message: response.message,
        canResend: true, // الزر يمكن الضغط عليه لأن العملية لم تنجح
      ));
      return;
    }

    // نجاح العملية: الرسالة تظهر فقط، العداد مستمر
    emit(state.copyWith(
      status: ResendOtpStatus.success,
      message: response.message,
    ));
  } catch (e) {
    emit(state.copyWith(
      status: ResendOtpStatus.error,
      message: "حدث خطأ غير متوقع",
      canResend: true,
    ));
  }
}
}