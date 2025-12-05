import 'package:bloc/bloc.dart';

import '../../../domain/usecase/verification_code_usecase.dart';
import 'otp_event.dart';
import 'otp_state.dart';


class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final VerifyOtpUsecase useCase;

  OtpBloc(this.useCase) : super(OtpInitial()) {
    on<SubmitOtpEvent>((event, emit) async {
      emit(OtpLoading());

      try {
        final result = await useCase(otp: event.otp);
        emit(OtpSuccess(result.message));
      } catch (e) {
        emit(OtpFailed(e.toString()));
      }
    });
  }
}




// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../domain/usecases/resend_otp_usecase.dart';

// part 'resend_otp_event.dart';
// part 'resend_otp_state.dart';

// class ResendOtpBloc extends Bloc<ResendOtpEvent, ResendOtpState> {
//   final ResendOtpUseCase useCase;
//   Timer? _timer;

//   ResendOtpBloc(this.useCase)
//       : super(ResendOtpState(
//           status: ResendOtpStatus.initial,
//           canResend: false,
//           secondsRemaining: 60,
//           message: '',
//         )) {
//     on<StartTimerEvent>(_startTimer);
//     on<TickEvent>(_tick);
//     on<ResendPressedEvent>(_resendPressed);
//   }

//   /// بدء العداد
//   void _startTimer(StartTimerEvent event, Emitter<ResendOtpState> emit) {
//     emit(state.copyWith(
//       canResend: false,
//       secondsRemaining: 60,
//     ));

//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       add(TickEvent());
//     });
//   }

//   /// تحديث العد التنازلي
//   void _tick(TickEvent event, Emitter<ResendOtpState> emit) {
//     if (state.secondsRemaining > 0) {
//       emit(state.copyWith(secondsRemaining: state.secondsRemaining - 1));
//     } else {
//       emit(state.copyWith(canResend: true));
//       _timer?.cancel();
//     }
//   }

//   /// ضغط زر إعادة الإرسال
//   Future<void> _resendPressed(
//       ResendPressedEvent event, Emitter<ResendOtpState> emit) async {

//     if (!state.canResend) return;

//     emit(state.copyWith(status: ResendOtpStatus.loading));

//     try {
//       final response = await useCase(event.userId);

//       /// معالجة الحالات حسب الرسالة
//       if (response.message.contains("غير موجود")) {
//         emit(state.copyWith(
//           status: ResendOtpStatus.error,
//           message: "هذا الحساب غير موجود.",
//         ));
//         return;
//       }

//       if (response.message.contains("مفعّل مسبقًا")) {
//         emit(state.copyWith(
//           status: ResendOtpStatus.error,
//           message: "الحساب مفعّل مسبقًا، لا حاجة لإعادة إرسال رمز التحقق.",
//         ));
//         return;
//       }

//       /// نجاح العملية
//       emit(state.copyWith(
//         status: ResendOtpStatus.success,
//         message: response.message,
//       ));

//       add(StartTimerEvent());
//     } catch (e) {
//       emit(state.copyWith(
//         status: ResendOtpStatus.error,
//         message: "حدث خطأ غير متوقع",
//       ));
//     }
//   }

//   @override
//   Future<void> close() {
//     _timer?.cancel();
//     return super.close();
//   }
// }
